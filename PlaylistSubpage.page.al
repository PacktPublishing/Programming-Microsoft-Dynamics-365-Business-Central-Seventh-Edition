page 50109 "Playlist Subpage"
{
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = None;
    SourceTable = "Playlist Line";
    AutoSplitKey = true;
    DelayedInsert = true;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(Type; Rec.Type) { }
                field("No."; Rec."No.") { }
                field("Data Format"; Rec."Data Format") { }
                field(Description; Rec.Description) { }
                field(Duration; Rec.Duration) { }
                field("Start Time"; Rec."Start Time") { }
                field("End Time"; Rec."End Time") { }
            }
        }
    }
}