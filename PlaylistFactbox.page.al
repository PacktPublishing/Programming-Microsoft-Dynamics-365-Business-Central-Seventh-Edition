page 50112 "Playlist Factbox"
{
    PageType = CardPart;
    ApplicationArea = All;
    UsageCategory = None;
    SourceTable = "Playlist Header";

    layout
    {
        area(Content)
        {
            field("PSAs Required"; Rec."PSAs Required") { }
            field("PSA Count"; Rec."PSA Count") { }
            field("Ads Required"; Rec."Ads Required") { }
            field("Ads Count"; Rec."Ads Count") { }
            field("News Required"; Rec."News Required") { }
            field("News Count"; Rec.GetNewsWeatherSportsCount(1)) { }
            field("Weather Required"; Rec."Weather Required") { }
            field("Weather Count"; Rec.GetNewsWeatherSportsCount(2)) { }
            field("Sports Required"; Rec."Sports Required") { }
            field("Sports Count"; Rec.GetNewsWeatherSportsCount(3)) { }
        }
    }
}