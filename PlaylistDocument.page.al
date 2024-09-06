page 50104 "Playlist Document"
{
    PageType = Document;
    ApplicationArea = All;
    UsageCategory = None;
    SourceTable = "Playlist Header";

    layout
    {
        area(Content)
        {
            group(Playlist)
            {
                field("No."; Rec."No.") { }
                field("Radio Show No."; Rec."Radio Show No.")
                {
                    trigger OnValidate()
                    begin
                        CurrPage.Update();
                    end;
                }
                field(Description; Rec.Description) { }
                field("Broadcast Date"; Rec."Broadcast Date") { }
                field("Start Time"; Rec."Start Time") { }
                field("End Time"; Rec."End Time") { }
                field(Duration; Rec.Duration) { }
            }
            part(Lines; "Playlist Subpage")
            {
                SubPageLink = "Document No." = field("No.");
                SubPageView = sorting("Document No.", "Line No.");
            }
        }
        area(FactBoxes)
        {
            part(Factbox; "Playlist Factbox")
            {
                SubPageLink = "No." = field("No.");
            }
        }
    }
}