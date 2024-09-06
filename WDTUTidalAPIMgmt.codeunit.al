codeunit 50101 "WDTU Tidal API Mgmt"
{
    trigger OnRun()
    begin
    end;

    procedure GetTidalApiArtwork(Barcode: Text[30]; ItemNo: Code[20])
    var
        HttpClient: HttpClient;
        HttpHeaders: HttpHeaders;
        HttpResponseMessage: HttpResponseMessage;
        HttpRequestMessage: HttpRequestMessage;
        HttpContent: HttpContent;
        Response: Text;
        JsonBuffer: Record "JSON Buffer" temporary;
        lblURL: Label 'https://openapi.tidal.com/v2/albums?countryCode=US&include=artists&filter%5BbarcodeId%5D=%1';
    begin
        // Retrieve the content headers associated with the content
        HttpContent.GetHeaders(HttpHeaders);

        //To prevent error message about multiple content-type attributes
        if HttpHeaders.Contains('Content-Type') then
            HttpHeaders.Remove('Content-Type');

        //Tidal specific content type    
        HttpHeaders.Add('Content-Type', 'application/vnd.tidal.v1+json');
        HttpRequestMessage.Content := HttpContent;
        HttpRequestMessage.GetHeaders(HttpHeaders);

        //To prevent error message for multiple authorization attributes
        if HttpHeaders.Contains('Authorization') then
            HttpHeaders.Remove('Authorization');

        //Call the GetAccessToken function to get access_token from Tidal
        HttpHeaders.Add('Authorization', StrSubstNo('Bearer %1',
                        GetAccessToken(lblOAuthURL, lblClientId, lblClientSecret)));

        //Send URL with Barcode value from Item
        HttpRequestMessage.SetRequestUri(StrSubstNo(lblUrl, Barcode));
        HttpRequestMessage.Method := 'GET';
        if HttpClient.Send(HttpRequestMessage, HttpResponseMessage) then begin
            HttpResponseMessage.Content.ReadAs(Response);
            if HttpResponseMessage.IsSuccessStatusCode then begin
                //Populate Json Buffer table with response for easy data retrieval
                JsonBuffer.ReadFromText(Response);
                JsonBuffer.SetRange(Path, 'data[0].attributes.imageLinks[0].href');
                //After getting the 1080x1080.jpg image url, load it into the item Picture Blob field
                if JsonBuffer.FindLast() then
                    ImportItemPictureFromURL(JsonBuffer.Value, ItemNo);
            end else
                Message('Image for %1 request failed: %2', ItemNo, HttpResponseMessage);
        end;
    end;

    local procedure GetAccessToken(URL: Text; ClientId: Text; ClientSecret: Text) AccessToken: Text
    var
        HttpResponseMessage: HttpResponseMessage;
        HttpRequestMessage: HttpRequestMessage;
        HttpClient: HttpClient;
        HttpContent: HttpContent;
        HttpHeaders: HttpHeaders;
        JsonObject: JsonObject;
        JsonToken: JsonToken;
        JsonValue: JsonValue;
        ContentText: Text;
        ResponseText: Text;
    begin
        //set content body
        ContentText := StrSubstNo(lblContent, lblGrantType, lblScope, lblClientId, lblClientSecret);
        HttpContent.WriteFrom(ContentText);

        // Retrieve the content headers associated with the content, assign form content type
        HttpContent.GetHeaders(HttpHeaders);
        HttpHeaders.Clear();
        HttpHeaders.Add('Content-Type', 'application/x-www-form-urlencoded');

        // Assign content to Request Message Content, set method to POST
        HttpRequestMessage.Content := HttpContent;
        HttpRequestMessage.SetRequestUri(URL);
        HttpRequestMessage.Method := 'POST';

        //Send the message and get the response
        HttpClient.Send(HttpRequestMessage, HttpResponseMessage);

        //Make sure the status code is of success type
        if not HttpResponseMessage.IsSuccessStatusCode() then
            error('Failed attempt. Status Code is %1', HttpResponseMessage.HttpStatusCode);

        // Read the response message content
        HttpResponseMessage.Content().ReadAs(ResponseText);
        if not JsonObject.ReadFrom(ResponseText) then
            error('Cannot read response text as JSON');
        if not JsonObject.Contains('access_token') then
            error('Element "access_token" not found in JSON response.');

        // Retrieve the access token    
        JsonObject.Get('access_token', JsonToken);
        JsonValue := JsonToken.AsValue();
        JsonToken.WriteTo(AccessToken);
        AccessToken := DelChr(AccessToken, '<>', '"');
    end;

    procedure ImportItemPictureFromURL(ImageURL: Text; ItemNo: Code[20])
    var
        Item: Record Item;
        HttpClient: HttpClient;
        HttpResponseMessage: HttpResponseMessage;
        InStr: InStream;
    begin
        If not HttpClient.Get(ImageURL, HttpResponseMessage) then
            Error('URL is not a valid image: %1', ImageURL);
        HttpResponseMessage.Content.ReadAs(InStr);
        if Item.Get(ItemNo) then begin
            Clear(Item.Picture);
            Item.Picture.ImportStream(InStr, 'Album cover for ' + Format(Item."No."));
            Item.Modify(true);
        end;
    end;

    var
        lblContent: Label 'grant_type=%1&scope=%2&client_id=%3&client_secret=%4';
        lblGrantType: Label 'client_credentials';
        lblScope: Label 'https://auth.tidal.com/v1/oauth2/token';
        lblClientId: Label '5avqWnb4dNe9TQWf'; //Comment: sign up for free at https://developer.tidal.com/
        lblClientSecret: Label 'UQat7j0F7Db9sBs4p9zNlru2sor0f9qEf5MlhVEIAlU='; //Comment: sign up for free at https://developer.tidal.com/
        lblOAuthURL: Label 'https://auth.tidal.com/v1/oauth2/token';
}