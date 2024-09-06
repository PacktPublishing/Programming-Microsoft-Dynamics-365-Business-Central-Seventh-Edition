table 50102 "Playlist Header"
{
    fields
    {
        field(1; "No."; Code[20]) { }
        field(2; "Radio Show No."; Code[20])
        {
            TableRelation = "Radio Show"."No.";

            trigger OnValidate()
            var
                RadioShow: Record "Radio Show";
            begin
                if RadioShow.Get("Radio Show No.") then begin
                    "PSAs Required" := RadioShow."PSAs Required";
                    "Ads Required" := RadioShow."Ads Required";
                    "News Required" := RadioShow."News Required";
                    "Sports Required" := RadioShow."Sports Required";
                    "Weather Required" := RadioShow."Weather Required";
                end else begin
                    "PSAs Required" := false;
                    "Ads Required" := false;
                    "News Required" := false;
                    "Sports Required" := false;
                    "Weather Required" := false;
                end;
            end;
        }
        field(3; Description; Text[100])
        {
            FieldClass = FlowField;
            CalcFormula = lookup("Radio Show".Name where("No." = field("Radio Show No.")));
            Editable = false;
        }
        field(4; "Broadcast Date"; Date) { }
        field(5; Duration; Duration)
        {
            FieldClass = FlowField;
            CalcFormula = lookup("Radio Show"."Run Time" where("No." = field("Radio Show No.")));
            Editable = false;
        }
        field(6; "Start Time"; Time)
        {
            trigger OnValidate()
            var
                RadioShow: Record "Radio Show";
            begin
                RadioShow.Get("Radio Show No.");
                "End Time" := "Start Time" + RadioShow."Run Time";
            end;
        }
        field(7; "End Time"; Time) { }
        field(10; "PSA Count"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("Playlist Line" where("Document No." = field("No."), Type = const(Item), "Data Format" = const(PSA)));
            Editable = false;
        }
        field(11; "PSAs Required"; Boolean) { }
        field(12; "Ads Count"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("Playlist Line" where("Document No." = field("No."), Type = const(Item), "Data Format" = const(Advertisement)));
            Editable = false;
        }
        field(13; "Ads Required"; Boolean) { }
        field(14; "News Required"; Boolean) { }
        field(15; "News Duration"; Duration) { }
        field(16; "Sports Required"; Boolean) { }
        field(17; "Sports Duration"; Duration) { }
        field(18; "Weather Required"; Boolean) { }
        field(19; "Weather Duration"; Duration) { }
    }

    procedure GetNewsWeatherSportsCount(Category: Option ,News,Weather,Sports) Count: Integer
    var
        PlaylistLine: Record "Playlist Line";
        RadioShow: Record "Radio Show";
    begin
        PlaylistLine.SetRange("Document No.", "No.");
        PlaylistLine.SetRange(Type, PlaylistLine.Type::Show);
        if PlaylistLine.FindSet() then
            repeat
                RadioShow.Get(PlaylistLine."No.");
                case Category of
                    Category::News:
                        if RadioShow."Radio Show Type" = 'NEWS' then
                            Count += 1;
                    Category::Weather:
                        if RadioShow."Radio Show Type" = 'WEATHER' then
                            Count += 1;
                    Category::Sports:
                        if RadioShow."Radio Show Type" = 'SPORTS' then
                            Count += 1;
                end;
            until PlaylistLine.Next = 0;
    end;
}