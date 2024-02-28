report 50100 "Radio Shows"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = MyWordLayout;

    dataset
    {
        dataitem(DataItemName; "Radio Show")
        {
            column(No; "No.") { }
            column(RadioShowType; "Radio Show Type") { }
            column(Name; "Name") { }
            column(RunTime; "Run Time") { }
            column(HostCode; "Host Code") { }
            column(HostName; "Host Name") { }
            column(AverageListeners; "Average Listeners") { }
            column(AudienceShare; "Audience Share") { }
            column(AdvertisingRevenue; "Advertising Revenue") { }
            column(RoyaltyCost; "Royalty Cost") { }
        }
    }

    rendering
    {
        layout(MySQLReportLayout)
        {
            Type = RDLC;
            LayoutFile = 'RadioShows.rdl';
        }
        layout(MyWordLayout)
        {
            Type = Word;
            LayoutFile = 'RadioShows.docx';
        }
        layout(MyExcelLayout)
        {
            Type = Excel;
            LayoutFile = 'RadioShows.xlsx';
        }
    }
}