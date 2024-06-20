page 50141 "Lot Avail. by Bin"
{
    ApplicationArea = All;
    Caption = 'Lot Avail. by Bin';
    PageType = List;
    SourceTable = "Warehouse Entry";
    SourceTableTemporary = true;
    UsageCategory = Lists;
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Item No."; Rec."Item No.") { ApplicationArea = All; }
                field("Location Code"; Rec."Location Code") { ApplicationArea = All; }
                field("Bin Code"; Rec."Bin Code") { ApplicationArea = All; }
                field("Lot No."; Rec."Lot No.") { ApplicationArea = All; }
                field(Quantity; Rec.Quantity) { ApplicationArea = All; }
            }
        }
    }
    trigger OnOpenPage()
    var
        LotAvail: Query "Lot Avail. by Bin";
    begin
        //LotAvail.SetFilter(Entry_No_, '<>0');
        LotAvail.Open();
        while LotAvail.Read() do begin
            Rec.Init();
            Rec."Entry No." := LotAvail.Entry_No_;
            Rec."Item No." := LotAvail.Item_No;
            Rec."Location Code" := LotAvail.Location_Code;
            Rec."Bin Code" := LotAvail.Bin_Code;
            Rec."Lot No." := LotAvail.Lot_No;
            Rec.Quantity := LotAvail.Sum_Quantity;
            Rec.Insert(false);
        end;
    end;
}





