table 50100 "Radio Show"
{

    fields
    {
        field(1; "No."; Code[20]) { }
        field(2; "Radio Show Type"; Code[10]) { TableRelation = "Radio Show Type"; }
        field(3; "Name"; Text[100]) { }
        field(4; "Run Time"; Duration) { }
        field(5; "Host Code"; Code[20]) { }
        field(6; "Host Name"; Text[100]) { }
        field(7; "Average Listeners"; Decimal)
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = average("Listenership Entry"."Listener Count"
            where("Radio Show No." = field("No."), Date = field("Date Filter")));
        }
        field(8; "Audience Share"; Decimal)
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = average("Listenership Entry"."Audience Share"
            where("Radio Show No." = field("No."), Date = field("Date Filter")));
        }
        field(9; "Advertising Revenue"; Decimal)
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = sum("Radio Show Entry"."Fee Amount"
            where(
                "Radio Show No." = field("No."),
                "Data Format" = filter(Advertisement)
                ));
        }
        field(10; "Royalty Cost"; Decimal)
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = sum("Radio Show Entry"."Fee Amount"
            where(
                "Radio Show No." = field("No."),
                Date = field("Date Filter"),
                "Data Format" = filter(Vinyl | CD | MP3)
            ));
        }
        field(11; Frequency; Option) { OptionMembers = Hourly,Daily,Weekly,Monthly; }
        field(12; "PSAs Required"; Boolean) { }
        field(13; "Ads Required"; Boolean) { }
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
        key(ShowType; "Radio Show Type") { }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "No.", Name, "Host Name") { }
        fieldgroup(Brick; "No.", Name, "Audience Share") { }
    }
}
