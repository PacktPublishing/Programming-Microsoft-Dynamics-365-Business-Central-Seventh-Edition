codeunit 50100 "WDTU SOAP Web Services"
{
    trigger OnRun()
    begin
    end;

    procedure ExportCustAddress(pCustNo: Code[20];
            var ExportAddress: XmlPort "WDTU Export Customer Address")
    begin
        ExportAddress.FilterCustRec(pCustNo);
        ExportAddress.Export();
    end;

}
