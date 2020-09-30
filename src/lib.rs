pub mod point_capnp {
    include!(concat!(env!("OUT_DIR"), "/cpnp/point_capnp.rs"));
}

pub mod command_capnp {
    include!(concat!(env!("OUT_DIR"), "/cpnp/command_capnp.rs"));
}

pub mod script_capnp {
    include!(concat!(env!("OUT_DIR"), "/cpnp/script_capnp.rs"));
}

pub mod world_capnp {
    include!(concat!(env!("OUT_DIR"), "/cpnp/world_capnp.rs"));
}

pub mod room_capnp {
    include!(concat!(env!("OUT_DIR"), "/cpnp/room_capnp.rs"));
}
