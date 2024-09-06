page 50105 "Playlist Item Rates"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Playlist Item Rate";

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Item No."; Rec."Item No.") { }
                field("Publisher Code"; Rec."Publisher Code") { }
                field("Rate Amount"; Rec."Rate Amount") { }
                field("Source Type"; Rec."Source Type") { }
                field("Source No."; Rec."Source No.") { }
                field("Start Time"; Rec."Start Time") { }
                field("End Time"; Rec."End Time") { }
            }
        }
    }
}