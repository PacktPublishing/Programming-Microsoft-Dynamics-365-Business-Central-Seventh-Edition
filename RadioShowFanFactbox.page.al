page 50110 "Radio Show Fan Factbox"
{
    PageType = ListPart;
    ApplicationArea = All;
    SourceTable = "Radio Show Fan";

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(Name; Rec.Name) { }
                field("E-Mail"; Rec."E-Mail") { }
                field("Last Contacted"; Rec."Last Contacted") { }
            }
        }
    }
}