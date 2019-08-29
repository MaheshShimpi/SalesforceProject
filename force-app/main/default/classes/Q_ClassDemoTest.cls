@isTest
public class Q_ClassDemoTest {
    @isTest
    public static void Q_ClassTest(){
        Account acc = new Account(Name='Test Queueable Account');
        insert acc;
        Q_ClassDemo qClass = new Q_ClassDemo(acc);
        Test.startTest();
        Id batchId = System.enqueueJob(qClass);
        Test.stopTest();
        /*AsyncApexJob jobinfo = [SELECT Id, CreatedDate, JobType, ApexClassId, Status, TotalJobItems, CompletedDate, MethodName, ParentJobId, NumberOfErrors FROM AsyncApexJob Where Id =: batchId];
        System.debug('jobinfo' + jobinfo);
        List<Contact> conlist = [Select Id, Name, FirstName, LastName From Contact Where AccountId =: acc.Id];
        System.assertNotEquals(null, conlist);
        System.assertEquals('Queueable', conlist.get(0).FirstName);*/
        List<Account> accList = [Select Id, Name, Industry From Account Where Id=:acc.id];
        System.assertNotEquals(null, accList);
        System.assertEquals(1, accList.size(),'More than one Account found');
        System.assertEquals('Updated Queueable Account', accList.get(0).Name);
        System.assertEquals('Education', accList.get(0).Industry);
    }
}