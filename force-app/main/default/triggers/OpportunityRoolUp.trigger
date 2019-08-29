trigger OpportunityRoolUp on Opportunity (after insert, after update, after delete, after undelete) {
  // List of parent record ids to update
  Set<Id> parentIds = new Set<Id>();
  // In-memory copy of parent records
  Map<Id,Account> parentRecords = new Map<Id,Account>();
  // Gather the list of ID values to query on
    for(Opportunity c:Trigger.isDelete?Trigger.old:Trigger.new){
        parentIds.add(c.AccountId);
    }
   
  // Avoid null ID values
  parentIds.remove(null);
  // Create in-memory copy of parents
  for(Id parentId:parentIds)
    parentRecords.put(parentId,new Account(Id=parentId,RollupField__c=0));
  // Query all children for all parents, update Rollup Field value
    for(Opportunity c:[select AccountId, Amount from Opportunity where AccountId in :parentIds]){
        parentRecords.get(c.AccountId).RollupField__c += c.Amount;
        System.debug('OP Id'+c.Id+'  Amt ='+c.Amount);
    }
    
  // Commit changes to the database
  Database.update(parentRecords.values());
}