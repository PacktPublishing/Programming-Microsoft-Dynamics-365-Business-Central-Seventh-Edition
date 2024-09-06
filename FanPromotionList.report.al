report 50102 "Fan Promotion List"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = WordLayout;

    dataset
    {
        dataitem(RadioShowFan; "Radio Show Fan")
        {
            column(Name; Name) { }
            column(Address; Address) { }
            column(Address_2; "Address 2") { }
            column(City; City) { }
            column(Post_Code; "Post Code") { }
            column(Country_Region_Code; "Country/Region Code") { }
            column(CountryName; CountryName) { }

            trigger OnAfterGetRecord()
            var
                CountryRegion: Record "Country/Region";
            begin
                // Look up the Country Name using the Country/Region Code
                CountryRegion.Get("Country/Region Code");
                CountryName := CountryRegion.Name;

                // Calculate the fan's age
                FanAge := Round(((WorkDate() - "Birth Date") / 365), 1.0, '<');

                // Select Fans to receive promotional material
                SelectThisFan := false;
                if Age12OrLess and (FanAge <= 12) then
                    SelectThisFan := true;
                if Age13to18 and (FanAge > 12) and (FanAge < 19) then
                    SelectThisFan := true;
                if Age19to34 and (FanAge > 18) and (FanAge < 35) then
                    SelectThisFan := true;
                if Age35to50 and (FanAge > 34) and (FanAge < 51) then
                    SelectThisFan := true;
                if AgeOver50 and (FanAge > 50) then
                    SelectThisFan := true;
                if Male and (Gender = Gender::Male) then
                    SelectThisFan := true;
                if Female and (Gender = Gender::Female) then
                    SelectThisFan := true;
                if Nonbinary and (Gender = Gender::Nonbinary) then
                    SelectThisFan := true;

                // If this Fan not selected, skip this Fan record on report
                if not SelectThisFan then
                    CurrReport.Skip();
            end;
        }
    }

    requestpage
    {
        layout
        {
            area(content)
            {
                group(Options)
                {
                    field(Age12orLess; Age12orLess) { Caption = 'Age 12 or less'; }
                    field(Age13to18; Age13to18) { Caption = 'Age 13 to 18'; }
                    field(Age19to34; Age19to34) { Caption = 'Age 19 to 34'; }
                    field(Age35to50; Age35to50) { Caption = 'Age 34 to 50'; }
                    field(AgeOver50; AgeOver50) { Caption = 'Age over 50'; }
                    field(Male; Male) { Caption = 'Male'; }
                    field(Female; Female) { Caption = 'Female'; }
                    field(Nonbinary; Nonbinary) { Caption = 'Nonbinary'; }
                }
            }
        }
    }

    rendering
    {
        layout(WordLayout)
        {
            Type = Word;
            LayoutFile = 'FanPromotionList.docx';
        }
    }

    var
        CountryName: Text;
        Age12orLess: Boolean;
        Age13to18: Boolean;
        Age19to34: Boolean;
        Age35to50: Boolean;
        AgeOver50: Boolean;
        Male: Boolean;
        Female: Boolean;
        Nonbinary: Boolean;
        SelectThisFan: Boolean;
        FanAge: Integer;
}