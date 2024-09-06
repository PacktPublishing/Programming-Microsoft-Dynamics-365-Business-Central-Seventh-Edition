page 50107 "Listenership Entries"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = History;
    SourceTable = "Listenership Entry";

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Radio Show No."; Rec."Radio Show No.") { }
                field(Date; Rec.Date) { }
                field("Age Demographic"; Rec."Age Demographic") { }
                field("Audience Share"; Rec."Audience Share") { }
                field("Start Time"; Rec."Start Time") { }
                field("End Time"; Rec."End Time") { }
                field("Ratings Source Entry No."; Rec."Ratings Source Entry No.") { }
                field("Entry No."; Rec."Entry No.") { }
            }
        }
    }
}