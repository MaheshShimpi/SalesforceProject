@isTest
public with sharing class BookService_UnitTest {
    @isTest
    public static void unittest_Postmethoad(){
        RestRequest request = new RestRequest();
        request.requestURI = '/services/apexrest/v1/BookMgt1/';
        request.httpMethod = 'POST';
        request.addHeader('Content-Type','application/json');
        request.addHeader('Accept','application/json');
        // request.addHeader('Authorization', 'Bearer '+UserInfo.getSessionId());
        BookService2.BookInfo bookinfo = new BookService2.BookInfo();
        bookinfo.book = new Book__c(Name='Test Book', Description__c='This is test book');
        request.requestBody = Blob.ValueOf(JSON.serialize(bookinfo));
        Test.startTest();
            Book__c book = BookService2.doPostBook(bookinfo);
            System.assertEquals('Test Book', book.Name);
            System.assertNotEquals(null, book.Id);
        Test.stopTest();
    }
    @isTest
    public static void unittest_Updatemethoad(){
        RestRequest request = new RestRequest();
        request.requestURI = '/services/apexrest/v1/BookMgt1/';
        request.httpMethod = 'PUT';
        request.addHeader('Content-Type','application/json');
        request.addHeader('Accept','application/json');
        // request.addHeader('Authorization', 'Bearer '+UserInfo.getSessionId());
        BookService2.BookInfo bookinfo = new BookService2.BookInfo();
        bookinfo.book = new Book__c(Name='Update Test Book', Description__c='This is test book');
        request.requestBody = Blob.ValueOf(JSON.serialize(bookinfo));
        String id = getBookId();//'a0F2v00001Me8tZEAR';//
        request.addParameter('Id', id);    
        RestContext.request = request;
        Test.startTest();
            Book__c book = BookService2.doPutBook(bookinfo);
            System.assertEquals('Update Test Book', book.Name);
            System.assertNotEquals(null, book.Id);
        Test.stopTest();
    }
    public static String getBookId(){
        Book__c book = new Book__c(Name='Test Book', Description__c='Test book');
        insert book;
        return book.Id;
    }
}