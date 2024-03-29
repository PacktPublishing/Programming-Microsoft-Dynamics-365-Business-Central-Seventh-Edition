table 50100 "Radio Show"
{
    fields
    {
        field(1; "No."; Code[20]) { }
        field(2; "Radio Show Type"; Code[10]) { TableRelation = "Radio Show Type"; }
        field(3; "Name"; Text[50]) { }
        field(4; "Run Time"; Duration) { }
        field(5; "Host Code"; Code[20]) { }
        field(6; "Host Name"; Text[50]) { }
        field(7; "Average Listeners"; Decimal) 
                {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = average ("Listernership Entry"."Listener Count"
            where ("Radio Show No." = field ("No."), Date = field ("Date Filter")));
        }
        field(8; "Audience Share"; Decimal) 
                {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = average ("Listernership Entry"."Audience Share"
            where ("Radio Show No." = field ("No."), Date = field ("Date Filter")));
        }
        field(9; "Advertising Revenue"; Decimal) 
                {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = sum ("Radio Show Entry"."Fee Amount"
            where (
                "Radio Show No." = field ("No."),
                "Data Format" = filter (Advertisement)
                ));
        }
        field(10; "Royalty Cost"; Decimal) { }
        field(11; Frequency; Enum "Radio Show Frequency") { }
        field(12; "PSA Planned Quantity"; Integer) { }
        field(13; "Ads Planned Quantity"; Integer) { }
        field(14; "News Required"; Boolean) { InitValue = true; }
        field(15; "News Duration"; Duration) { }
        field(16; "Sports Required"; Boolean) { InitValue = true; }
        field(17; "Sports Duration"; Duration) { }
        field(18; "Weather Required"; Boolean) { InitValue = true; }
        field(19; "Weather Duration"; Duration) { }
        field(20; "Date Filter"; Date) { FieldClass = FlowFilter; }
    }
    keys
    {
        key(PK; "No.") { }
        key(Name; Name) { }
        key(HostName; "Host Name") { }

    }
    fieldgroups
    {
        fieldgroup(DropDown; "No.", Name, "Host Name") { }
        fieldgroup(Brick; "No.", Name, "Audience Share") { }
    }
}
