@RestResource(urlMapping='/v1/BookMgt/')
global class BookService {
    @HttpGet
    global static void doGetBook(){
        try{
            // Map<String, String> paramsMap = RestContext.request.params;
            String bookId = RestContext.request.params.get('Id');
            Book__c book = [Select Id, Name, Description__c From Book__c Where Id =: bookId];
            // System.debug(book);
            RestContext.response.responseBody = Blob.valueOf(JSON.serialize(book));
            // return book;
        }catch(System.StringException e){
            RestContext.response.statusCode = 400;
            SalesforceError[] errs = new SalesforceError[]{ 
                new SalesforceError('BAD_REQUEST', 'Param: Id is not a valid Id')
            };
            RestContext.response.responseBody = Blob.valueOf(JSON.serialize(errs));
        }catch(System.QueryException e){
            RestContext.response.statusCode = 404;
            SalesforceError[] errs = new SalesforceError[]{ 
                new SalesforceError('NOT_FOUND', 'Requested Book not found')
            };
            RestContext.response.responseBody = Blob.valueOf(JSON.serialize(errs));
        }catch(Exception e){ //something else happened
            RestContext.response.statusCode = 500;
            SalesforceError[] errs = new SalesforceError[]{ 
                new SalesforceError('BAD_REQUEST', e.getMessage())
            };
            RestContext.response.responseBody = Blob.valueOf(JSON.serialize(errs));
        }    
    }

    @HttpDelete
    global static String doDeleteBook(){
        Map<String, String> paramsMap = RestContext.request.params;
        String bookId = paramsMap.get('Id');
        Book__c book = [Select Id, Name, Description__c From Book__c Where Id =: bookId];
        
        delete book;
        System.debug(book);
        return 'Record Deleted.';
    }
    // =================
    // @HttpPost
    // global static Book__c doPostBook(String Name, String Description){
    //     Book__c book = new Book__c( Name = name , Description__c = Description );
    //     insert book;
    //     return book;
    // }
    // --HTTP POST method along with Wrapper class
    @HttpPost
    global static Book__c doPostBook(BookInfo bookInfo){
        Book__c book = bookInfo.book;
        insert book;
        return book;
    }    
    // Send the POST request in below XML form or JSON form
    // ====================================================
    // <request>
    //     <bookInfo>
    //           <book>
    //               <Name> DataSrtutures</Name>
    //               <Description__c>DS bok</Description__c>
    //           </book>
    //     </bookInfo>
    // </request>
    // --------------------OR-------------------------
    // {
    //     "bookInfo": {
    //         "book" : {
    //             "Name" : "Name of the Book",
    //             "Description__c" : "Description of the Book"
    //         }
    //     }
    // }
    // =====================================================
    // @HttpPut
    // global static Book__c doPutBook(String Name){
    //     Map<String, String> paramsMap = RestContext.request.params;
    //     String bookId = paramsMap.get('Id');
    //     Book__c book = new Book__c( Name = name , Id = bookId);
    //     update book;
    //     return book;        
    // }
    // --HTTP PUT method along with Wrapper class
    @HttpPut
    global static Book__c doPutBook(BookInfo bookInfo){
        Book__c book = bookInfo.book;
        Map<String, String> paramsMap = RestContext.request.params;
        String bookId = paramsMap.get('Id');
        book.Id = bookId;
        update book;
        return book;        
    }
    @HttpPatch
    global static String doPatchBook(BookInfo bookInfo){
        Book__c book = bookInfo.book;
        Map<String, String> paramsMap = RestContext.request.params;
        String bookId = paramsMap.get('Id');
        book.Id = bookId;
        update book;
        return 'Book Updated';        
    }
    global class BookInfo{
        Book__c book {get; set;}
    }
    //standard salesforce error response structure
    public class SalesforceError {
        public String errorCode;
        public String message;
        public SalesforceError(String errorCode, string message){
            this.errorCode = errorCode;
            this.message = message;
        }
    }
}

// these are the comments that are new to this file
