page 50114 "API WDTU Playlist"
{
    PageType = API;
    APIPublisher = 'wdtu';
    APIGroup = 'radio';
    APIVersion = 'v1.0';
    EntityName = 'playlist';
    EntitySetName = 'playlists';
    SourceTable = "Playlist Header";
    DelayedInsert = true;
    ODataKeyFields = SystemId;

    layout
    {
        area(Content)
        {
            repeater(Playlist)
            {
                field(id; Rec.SystemId) { }
                field(playlistNo; Rec."No.") { }
                field(radioShowNo; Rec."Radio Show No.") { }
                field(description; Rec.Description) { }
                field(broadcastDate; Rec."Broadcast Date") { }
                field(startTime; Rec."Start Time") { }
                field(endTime; Rec."End Time") { }
                field(showDuration; Rec.Duration) { }
                field(lastModifiedDateTime; Rec.SystemModifiedAt) { }
                part(Lines; "API Playlist Subpage")
                {
                    EntityName = 'playlistLine';
                    EntitySetName = 'playlistLines';
                    SubPageLink = PlaylistId = field(SystemId);
                }
            }
        }
    }
}