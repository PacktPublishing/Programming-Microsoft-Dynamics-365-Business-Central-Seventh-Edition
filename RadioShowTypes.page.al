page 50102 "Radio Show Types"
{
    PageType = List;
    SourceTable = "Radio Show Type";
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(Code; Rec.Code) { }
                field(Description; Rec.Description) { }
            }
        }
    }
}