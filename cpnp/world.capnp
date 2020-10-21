@0x8bd03b1f356ac9da;

using Point = import "point.capnp";
using Script = import "script.capnp";

struct Json {
    value @0: Text;
}

struct Uuid {
    data @0: Data;
}

struct Bot {
    id @0: UInt32;
    position @1: Point.WorldPosition;
    owner @2: Uuid;
    body @3: Json;
}

struct Structure {
    id @0: UInt32;
    position @1: Point.WorldPosition;
    owner @2: Uuid;

    # Body
    spawn @3: StructureSpawn;
}

struct StructureSpawn {
    timeToSpawn @0: UInt32;
    spawning @1: UInt32;
    energy @2: UInt32;
    energyMax @3: UInt32;
    energyRegen @4: UInt32;
}

struct Resource {
    id @0: UInt32;
    position @1: Point.WorldPosition;

    # Body
    energy@2 : Energy;
}

struct Energy {
    energy @0: UInt32;
    energyMax @1: UInt32;
}

struct WorldState {
    bots @0: List(Bot);
    resources @1: List(Resource);
    structures @2: List(Structure);
    logs @3: List(LogEntry);
    scriptHistory @4: List(Script.ScriptHistoryEntry);
}

struct LogEntry {
    entityId @0: UInt32;
    time @1: UInt64;
    payload @2: List(Text);
}
