table 50103 "Playlist Line"
{
    fields
    {
        field(1; "Document No."; Code[20]) { }
        field(2; "Line No."; Integer) { }
        field(3; Type; Option) { OptionMembers = ,Resource,Show,Item; }
        field(4; "No."; Code[20])
        {
            TableRelation = if (Type = const(Resource)) Resource."No."
            else
            if (Type = const(Show)) "Radio Show"."No."
            else
            if (Type = const(Item)) Item."No.";
        }
        field(5; "Data Format"; Enum "Playlist Data Format") { }
        field(6; "Publisher Code"; Code[10]) { }
        field(7; Description; Text[50]) { }
        field(8; Duration; Duration) { }
        field(9; "Start Time"; Time) { }
        field(10; "End Time"; Time) { }
    }

    keys
    {
        key(PK; "Document No.", "Line No.")
        {
            Clustered = true;
        }
    }

}