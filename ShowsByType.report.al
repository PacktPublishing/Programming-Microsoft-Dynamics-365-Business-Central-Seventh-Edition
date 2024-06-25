report 50101 "Shows By Type"
{
    DefaultRenderingLayout = ExcelLayout;
    Caption = 'Shows by Type';
    UsageCategory = ReportsAndAnalysis;

    dataset
    {
        dataitem(RadioShowType; "Radio Show Type")
        {
            column(UserComment; UserComment) { }
            column(Code_RadioShowType; Code) { }
            column(Type; Description) { }
            dataitem(RadioShow; "Radio Show")
            {
                DataItemLinkReference = RadioShowType;
                DataItemLink = "Radio Show Type" = field(Code);
                DataItemTableView = sorting("Radio Show Type");
                PrintOnlyIfDetail = true;
                column(No_RadioShow; "No.") { }
                column(Title; Name) { }
                column(Hours; "Run Time" / 86400000) { }
                dataitem(PlaylistHeader; "Playlist Header")
                {
                    DataItemLinkReference = RadioShow;
                    DataItemLink = "Radio Show No." = field("No.");
                    DataItemTableView = sorting("No.");
                    column(PostingDate_PlaylistHeader; "Broadcast Date") { }
                    column(StartTime_PlaylistHeader; "Start Time") { }
                }
            }
        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(Options)
                {
                    field(UserComment; UserComment)
                    {
                        ApplicationArea = All;
                        Caption = 'User Comment';
                    }
                }
            }
        }
    }

    rendering
    {
        layout(ExcelLayout)
        {
            Type = Excel;
            LayoutFile = './ShowsByTypeExcel.xlsx';
            Caption = 'Excel Layout';
            Summary = 'Shows by Type Excel';
        }
        layout(WordLayout)
        {
            Type = Word;
            LayoutFile = './ShowByTypeWord.docx';
            Caption = 'Word Layout';
            Summary = 'Shows by Type Word';
        }
        layout(RDLCLayout)
        {
            Type = RDLC;
            LayoutFile = './ShowsByTypeRDLC.rdlc';
            Caption = 'RDLC Layout';
            Summary = 'Shows by Type RDLC';
        }
    }

    labels
    {
        ReportTitle = 'Show Schedule by Type';
        ShowTitle = 'Title';
        ShowTypeTitle = 'Type';
        HourTitle = 'Hours';
    }

    var
        UserComment: Text;
}