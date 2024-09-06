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
                field("No."; Rec."No.") { }
                field(Name; Rec.Name) { }
                field("E-Mail"; Rec."E-Mail") { }
                field("Last Contacted"; Rec."Last Contacted") { }
                field(Address; Rec.Address) { }
                field("Post Code"; Rec."Post Code") { }
                field(City; Rec.City) { }
                field("Country/Region Code"; Rec."Country/Region Code") { }
                field(Gender; Rec.Gender) { }
                field("Birth Date"; Rec."Birth Date") { }
            }
        }
    }
}