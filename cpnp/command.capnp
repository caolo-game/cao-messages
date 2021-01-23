@0xcf70785d993fa691;

using Point = import "point.capnp";
using Script = import "script.capnp";

struct Uuid {
    data @0: Data;
}

enum StructureType {
    spawn @0;
}

struct PlaceStructureCommand {
    position @0: Point.WorldPosition;
    owner @1: Uuid;
    ty @2: StructureType;
}

struct UpdateEntityScriptCommand {
    userId @0: Uuid;
    entityId @1: UInt32;
    scriptId @2: Uuid;
}

struct UpdateScriptCommand {
    userId @0: Uuid;
    scriptId @1: Uuid;
    compilationUnit @2: Script.CompilationUnit;
}

struct SetDefaultScriptCommand {
    userId @0: Uuid;
    scriptId @1: Uuid;
}


struct CommandResult {
    union {
        ok @0 : Void;
        error @1: Text;
    }
}

struct TakeRoom {
    useId @0: Uuid;
    roomId @1: Point.AxialPoint;
}

interface Command {
    struct InputMessage {
        messageId @0: Uuid;
        union {
            placeStructure @1: PlaceStructureCommand;
            updateEntityScript @2: UpdateEntityScriptCommand;
            updateScript @3: UpdateScriptCommand;
            setDefaultScript @4: SetDefaultScriptCommand;
            takeRoom @5: TakeRoom;
        }
    }

    handle @0 (input: InputMessage) -> (result: CommandResult);
}
