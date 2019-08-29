public with sharing class ContactListController {
    // public ContactListController() {
        @AuraEnabled
        public static List<Contact> getContactList(String accountid){
            List<Contact> conlist = [Select Id, FirstName,LastName, Email, Phone From Contact Where Email != null And AccountId=:accountid];
            return conlist;
        }
        @AuraEnabled
        public static Contact createContact(Contact con, Id accountId){
            con.AccountId = accountId;
            insert con;
            return con;  
        }
        // @AuraEnabled
        // public static string methodName(){
            
        // }
    // }
    // fetch all source code from dev org
    // sfdx force:source:retrieve -u mahesh.shimpi681@resourceful-panda-7eggsg.com -x manifest/package.xml
}