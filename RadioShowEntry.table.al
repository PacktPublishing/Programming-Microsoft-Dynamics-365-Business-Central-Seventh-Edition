table 50105 "Radio Show Entry"
{
    fields
    {
        field(1; "Entry No."; Integer) { }
        field(2; "Radio Show No."; Code[20]) { }
        field(3; Type; Option) { OptionMembers = ,Resource,Show,Item; }
        field(4; "No."; Code[20]) { }
        field(5; "Data Format"; Enum "Playlist Data Format") { }
        field(6; Description; Text[100]) { }
        field(7; Date; Date) { }
        field(8; Time; Time) { }
        field(9; Duration; Duration) { }
        field(10; "Fee Amount"; Decimal) { }
        field(11; "ACSAP ID"; Integer) { }
        field(12; "Publisher Code"; Code[10]) { }
    }

    keys
    {
        key(PK; "Entry No.") { Clustered = true; }
        key(Reporting; "Radio Show No.", Date) { SumIndexFields = "Fee Amount"; }
        key(Reporting2; Type, "No.", Date) { SumIndexFields = "Fee Amount"; }
    }
}