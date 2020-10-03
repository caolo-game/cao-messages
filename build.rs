use std::fs::{read_dir, File, OpenOptions};
use std::io::prelude::*;

fn main() {
    let file_list = read_dir("cpnp")
        .expect("capnp dir list")
        .filter_map(|f| f.ok())
        .map(|f| f.path());

    let mut schema = OpenOptions::new()
        .write(true)
        .truncate(true)
        .create(true)
        .open("src/lib.rs")
        .expect("failed to open schema.rs");

    let mut compiler = ::capnpc::CompilerCommand::new();

    let mut schema_buf = String::new();
    for file in file_list {
        let fname = match file.file_name() {
            Some(fname) => fname,
            None => {
                // subdirs not yet supported...
                continue;
            }
        };
        let mut cpnp = File::open(&file).expect("failed to open schema file");
        schema_buf.clear();
        cpnp.read_to_string(&mut schema_buf).unwrap();

        let fname = fname.to_str().expect("expected utf8 filename");
        let fname = fname.replace(".", "_");

        writeln!(schema, "/// ```capnp").unwrap();
        for line in schema_buf.lines() {
            writeln!(schema, "/// {}", line).unwrap();
        }
        write!(
            schema,
            r#"/// ```
pub mod {} {{
     include!(concat!(env!("OUT_DIR"), "/cpnp/{}.rs"));
}}
"#,
            fname, fname
        )
        .unwrap();

        compiler.file(file);
    }

    compiler.run().expect("compiling schema");
}
