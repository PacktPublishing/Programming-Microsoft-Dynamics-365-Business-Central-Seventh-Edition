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

            trigger OnValidate()
            var
                Resource: Record Resource;
                Item: Record Item;
                RadioShow: Record "Radio Show";
            begin
                case Type of
                    Type::Resource:
                        begin
                            Resource.Get("No.");
                            Description := Resource.Name;
                        end;
                    Type::Item:
                        begin
                            Item.Get("No.");
                            Description := Item.Description;
                            "Data Format" := Item."Data Format";
                            Duration := Item.Duration;
                        end;
                    Type::Show:
                        begin
                            RadioShow.Get("No.");
                            Description := RadioShow.Name;
                        end;
                end;
            end;
        }
        field(5; "Data Format"; Enum "Playlist Data Format") { }
        field(6; "Publisher Code"; Code[10]) { }
        field(7; Description; Text[100]) { }
        field(8; Duration; Duration)
        {
            Editable = false;
        }
        field(9; "Start Time"; Time)
        {
            trigger OnValidate()
            begin
                if Duration <> 0 then
                    "End Time" := "Start Time" + Duration;
            end;
        }
        field(10; "End Time"; Time)
        {
            trigger OnValidate()
            begin
                if "Start Time" <> 0T then
                    Duration := "End Time" - "Start Time";
            end;
        }
    }

    keys
    {
        key(PK; "Document No.", "Line No.")
        {
            Clustered = true;
        }
    }
}