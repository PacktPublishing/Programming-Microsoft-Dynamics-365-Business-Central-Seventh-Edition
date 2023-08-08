table 50104 "Playlist Item Rate"
{
    fields
    {
        field(1; "Source Type"; Option) { OptionMembers = Vendor,Customer; }
        field(2; "Source No."; Code[20])
        {
            TableRelation =
            if ("Source Type" = const(Vendor)) Vendor."No."
            else
            if ("Source Type" = const(Customer)) Customer."No.";
        }
        field(3; "Item No."; Code[20]) { }
        field(4; "Start Time"; Time) { }
        field(5; "End Time"; Time) { }
        field(6; "Rate Amount"; Decimal) { }
        field(7; "Publisher Code"; Code[10]) { }
    }
}