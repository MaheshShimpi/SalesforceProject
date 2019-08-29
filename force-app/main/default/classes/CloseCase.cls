public class CloseCase {

    @AuraEnabled
    public static String createRecord (String Status,String recordId){
        System.debug('Status------'+Status);
        System.debug('recordId------'+recordId);
        Case caseRecord = new Case();
         List<Case> caseList = new List<Case>();
        if(recordId != null || !string.isEmpty(recordId)){
            caseRecord.Status=Status;
            caseRecord.Id=recordId;
            caseList.add(caseRecord);
            
        }
        if(caseList.size()>=0){
            Database.SaveResult[] results  = Database.update(caseList);
            System.debug('***results ****'+results );
        }
        return caseList[0].id;
    }  
}