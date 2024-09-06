page 50113 "API Playlist Subpage"
{
    APIGroup = 'radio';
    APIPublisher = 'wdtu';
    APIVersion = 'v1.0';
    ApplicationArea = All;
    Caption = 'apiPlaylistSubpage';
    DelayedInsert = true;
    EntityName = 'playlistLine';
    EntitySetName = 'playlistLines';
    PageType = API;
    SourceTable = "Playlist Line";

    layout
    {
        area(Content)
        {
            repeater(PlaylistLine)
            {
                field(systemId; Rec.SystemId) { }
                field(dataFormat; Rec."Data Format") { }
                field(type; Rec."Type") { }
                field(itemNo; Rec."No.") { }
                field(description; Rec.Description) { }
                field(publisherCode; Rec."Publisher Code") { }
                field(startTime; Rec."Start Time") { }
                field(endTime; Rec."End Time") { }
                field(lineDuration; Rec."Duration") { }
                field(systemModifiedAt; Rec.SystemModifiedAt) { }
            }
        }
    }
}