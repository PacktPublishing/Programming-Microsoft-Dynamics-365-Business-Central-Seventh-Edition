pageextension 50100 "Item List Extension" extends "Item List"
{
    actions
    {
        addafter("Inventory - List")
        {
            action("Lot Avail. by Bin")
            {
                ApplicationArea = All;
                Caption = 'Lot Avail. by Bin';
                RunObject = query "Lot Avail. by Bin";
            }
        }
    }
}




