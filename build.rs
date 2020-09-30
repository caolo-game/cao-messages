fn main() {
    ::capnpc::CompilerCommand::new()
        .file("cpnp/point.cpnp")
        .file("cpnp/world.cpnp")
        .file("cpnp/room.cpnp")
        .file("cpnp/command.cpnp")
        .file("cpnp/script.cpnp")
        .run()
        .expect("compiling schema");
}
