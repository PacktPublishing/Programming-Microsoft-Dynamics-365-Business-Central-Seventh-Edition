table 50106 "Listenership Entry"
{
    fields
    {
        field(1; "Entry No."; Integer) { }
        field(2; "Ratings Source Entry No."; Integer) { }
        field(3; Date; Date) { }
        field(4; "Start Time"; Time) { }
        field(5; "End Time"; Time) { }
        field(6; "Radio Show No."; Code[20]) { }
        field(7; "Listener Count"; Decimal) { }
        field(8; "Audience Share"; Decimal) { }
        field(9; "Age Demographic"; Enum "Age Demographic") { }
    }
    keys
    {
        key(PK; "Entry No.") { Clustered = true; }
        key(Reporting; "Radio Show No.", Date, "Start Time", "Age Demographic") { SumIndexFields = "Listener Count", "Audience Share"; }
    }
}