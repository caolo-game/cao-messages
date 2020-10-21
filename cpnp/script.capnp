@0xb47934fcdf48c012;

struct Card {
    name @0: Text;
    description @1: Text;
    input @2: List(Text);
    output @3: List(Text);
    constants @4: List(Text);
    ty @5: Text;
}

struct Schema {
    cards @0: List(Card);
}

struct Json {
    value @0: Data;
}

struct CompilerVersion {
    major @0: UInt8;
    minor @1: UInt8;
    patch @2: UInt16;
}

struct CompilationUnit {
    compilationUnit @0: Json;

    # Compiler version used to verify this compilation unit
    # null if it's unverified
    verfiedBy @1: CompilerVersion;
}

struct ScriptHistoryEntry {
    entityId @0: UInt32;
    payload @1: List(ScriptNodeId);
}

struct ScriptNodeId {
    lane @0: UInt16;
    pos @1: UInt16;
}
