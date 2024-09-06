xmlport 50100 "WDTU Export Customer Address"
{
    Caption = 'Export Address';
    Format = Xml;
    UseDefaultNamespace = true;
    DefaultNamespace = 'urn:microsoft-dynamics-nav/xmlports/x50000';

    schema
    {
        textelement(RootNodeName)
        {
            tableelement(Cust; Customer)
            {
                textelement(CustName)
                {
                    trigger OnBeforePassVariable()
                    begin
                        CustName := Cust.Name;
                    end;
                }
                textelement(FullAddress)
                {
                    trigger OnBeforePassVariable()
                    var
                        i: Integer;
                    begin
                        Cr := 13;
                        Lf := 10;
                        clear(FullAddress);
                        FormatAddr.Customer(CustAddr, Cust);
                        for i := 1 to 8 do begin
                            if CustAddr[i] <> '' then
                                FullAddress += CustAddr[i] + Format(Cr) + Format(Lf);
                        end;
                    end;
                }
            }
        }
    }

    var
        FormatAddr: Codeunit "Format Address";
        CustAddr: array[8] of Text[50];
        Cr: Char;
        Lf: Char;

    procedure FilterCustRec(pCustNo: Code[20])
    begin
        Cust.SetRange("No.", pCustNo);
    end;

}
