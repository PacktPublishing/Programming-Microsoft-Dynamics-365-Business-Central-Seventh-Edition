page 50111 "Radio Show Fans"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
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