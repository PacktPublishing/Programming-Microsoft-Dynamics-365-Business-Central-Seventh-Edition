query 50101 "API Listenership"
{
    APIGroup = 'radio';
    APIPublisher = 'wdtu';
    APIVersion = 'v1.0';
    EntityName = 'programListener';
    EntitySetName = 'programListeners';
    QueryType = API;

    elements
    {
        dataitem(listenershipEntry; "Listenership Entry")
        {
            column(radioShowNo; "Radio Show No.") { }
            column(showDate; "Date") { }
            column(audienceShare; "Audience Share") { }
            column(ageDemographic; "Age Demographic") { }
            column(listenerCount; "Listener Count") { }
            filter(dateFilter; Date) { }
            dataitem(radioShow; "Radio Show")
            {
                DataItemLink = "No." = listenershipEntry."Radio Show No.";
                SqlJoinType = InnerJoin;
                column(Name; Name) { }
                column(Host_Name; "Host Name") { }
            }
        }
    }
}