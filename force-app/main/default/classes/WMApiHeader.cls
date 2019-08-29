public with sharing class WMApiHeader {
    public String token;
    public WMApiHeader() {
        this.token = '83f93fc3-fda6-476b-bf87-8f23a2df1257:BErXl2CDds2dKqeJKNpKE9WQdOsaWQFAPzpPpHhh2JMvpKUQ9Tx-Igie_WWwjPDDi26EXllQJopYBfumezhTxQ';
    }
    public void get_order_list(){
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://marketplace.walmartapis.com/v3/orders?createdStartDate=2019-05-31T00:00:00Z');
        //req.setBody('grant_type=client_credentials');
        req.setMethod('GET');
        req.setHeader('WM_SVC.NAME', 'WatchBox');
        req.setHeader('WM_QOS.CORRELATION_ID', '123456aasda');
        req.setHeader('WM_SEC.ACCESS_TOKEN', getToken());
        req.setHeader('WM_SVC.VERSION', '1.0.0');
        req.setHeader('Content-Type', 'application/json');
        req.setHeader('Accept', 'application/json');
        
        System.debug(req.getBody());
        // Specify the required user name and password to access the endpoint
        // As well as the header and header information
    
        Blob headerValue = Blob.valueOf(this.token);
        String authorizationHeader = 'Basic ' +
        EncodingUtil.base64Encode(headerValue);
        req.setHeader('Authorization', authorizationHeader);
    
        // Create a new http object to send the request object
        // A response object is generated as a result of the request  
    
        Http http = new Http();
        HTTPResponse res = http.send(req);
        Map<String, Object> resObj = (Map<String, Object>)JSON.deserializeUntyped(res.getBody());

        System.debug(res.getBody());
    }
    public String getToken(){
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://marketplace.walmartapis.com/v3/token');
        Blob headerValue = Blob.valueOf(this.token);
        String authorizationHeader = 'Basic '+ EncodingUtil.base64Encode(headerValue);
        req.setHeader('Authorization', authorizationHeader);
        req.setMethod('POST');
        req.setHeader('WM_SVC.NAME', 'WatchBox');
        req.setHeader('WM_QOS.CORRELATION_ID', '123456aasda');
        req.setHeader('WM_SVC.VERSION', '1.0.0');
        req.setHeader('Content-Type', 'application/x-www-form-urlencoded');
        req.setHeader('Accept', 'application/json');
        req.setBody('grant_type=client_credentials');
        Http http = new Http();
        HTTPResponse res = http.send(req);
        Map<String, Object> resObj = (Map<String, Object>)JSON.deserializeUntyped(res.getBody());
        System.debug(resObj.get('access_token'));
        return (String)resObj.get('access_token');
        //System.debug(resObj.access_token);
        // return 
    }
    
}