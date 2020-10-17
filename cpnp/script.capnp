@0xb47934fcdf48c012;

struct Label {
    block @0: Int32;
}

struct LabelKV {
    key @0: Int32;
    val @1: Label;
}

struct CompiledScript {
    bytecode @0: Data;
    labels @1: List(LabelKV);
}

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

