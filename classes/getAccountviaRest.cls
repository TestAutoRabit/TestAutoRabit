public class getAccountviaRest{

 private final String clientId = '3MVG9Y6d_Btp4xp5JYrf6ubW9gXP5P73LvZFeFgKXoFhED8Hw0QTAkv50Tcp8ylJHEbT0AKaxQlL215tSUlZ4';
 private final String clientSecret = '4134139547023122812';
 private final String username = 'pulkitaccenture@salesforce.com';
 private final String password = 'Suntrust@1234sugECkDWpHDw4TVbPNmEhdyS';  

    
  public  List<Account> callgetAccount(){
    
    getAccountviaRest getAcc = new getAccountviaRest();
    
    String accessToken;
     
    accessToken = getAcc.ReturnAccessToken(getAcc);
    list<account> ListAccount=new List<account>();
     
    if(accessToken != null){
    
    {
        String endPoint = 'https://lightningaware-dev-ed.my.salesforce.com/services/apexrest/v1/getAccounts/';
            Http h2 = new Http();
            HttpRequest req1 = new HttpRequest();
            req1.setHeader('Authorization','Bearer ' + accessToken);
            req1.setHeader('Content-Type','application/json');
            req1.setHeader('accept','application/json');
            req1.setMethod('GET');
            req1.setEndpoint(endPoint);
            HttpResponse res1 = h2.send(req1);
            String trimmedResponse = res1.getBody().unescapeCsv().remove('\\');
            system.debug('@@@RESPONSE@@'+trimmedResponse);
            JSONParser parser = JSON.createParser(res1.getBody());
            set<account> accList=new set<account>();

            while (parser.nextToken() != null) {
                if((parser.getCurrentToken() == JSONToken.FIELD_NAME) ){
                    Account acc;
                    if ((parser.getCurrentToken() == JSONToken.FIELD_NAME) && (parser.getText() == 'Id')) {
                        // Get the value.
                        parser.nextToken();
                        // Compute the grand total price for all invoices.
                        String sId= parser.getText();
                        acc=new Account();
                        acc.Id=sId;
                        system.debug('Id@@@' + sId);
    
                        parser.nextToken();
                        if ((parser.getCurrentToken() == JSONToken.FIELD_NAME) && (parser.getText() == 'Name')) {
                            // Get the value.
                            parser.nextToken();
                            // Compute the grand total price for all invoices.
                            string sName= parser.getText();
                            acc.Name=sName;
                            system.debug('Name@@@' + sName );
                        }
                    }
                    accList.add(acc);
                }
                accList.remove(null);
            }
            ListAccount.AddAll(accList);
            system.debug('AccountList@@@@'+Json.serialize(ListAccount));
        }
        
    }return ListAccount;
}
  
  public String ReturnAccessToken (getAccountviaRest acc)
  {
    
     String reqBody = 'grant_type=password&client_id='+ClientId+'&client_secret='+ClientSecret+'&username='+username+'&password='+password;

        
    Http h = new Http();
    HttpRequest req = new HttpRequest();
    req.setBody(reqBody);
    req.setMethod('POST');
    req.setEndpoint('https://login.salesforce.com/services/oauth2/token');
    
    HttpResponse res = h.send(req);
    deserializeResponse1 response = (deserializeResponse1)JSON.deserialize(res.getbody(),deserializeResponse1.class); 
    
    system.debug('@@@@res @@ '+res );
    system.debug('@@@@access_token@@'+response );
        return response.access_token;
        
  }
  
 public class deserializeResponse1{
  public String id;
  public String access_token;
 }  
        
 }