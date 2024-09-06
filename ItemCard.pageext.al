pageextension 50101 "Item Card Extension" extends "Item Card"
{
    layout
    {
        addafter(GTIN)
        {
            field(Barcode; Rec.Barcode)
            {
                ApplicationArea = All;
            }
        }
    }
    actions
    {
        addafter(CopyItem)
        {
            action(FetchAlbumCover)
            {
                Caption = 'Get Tidal Artwork';
                Image = Download;
                ApplicationArea = All;

                trigger OnAction()
                var
                    WdtuTidalAPI: Codeunit "WDTU Tidal API Mgmt";
                begin
                    WdtuTidalAPI.GetTidalApiArtwork(Rec.Barcode, Rec."No.");
                end;
            }
        }
        addafter(CopyItem_Promoted)
        {
            actionref(FetchAlbumCover_Promoted; FetchAlbumCover) { }
        }
    }
}

