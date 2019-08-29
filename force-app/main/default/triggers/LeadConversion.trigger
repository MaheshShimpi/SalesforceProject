trigger LeadConversion on Lead (after insert) {
    
    /*List<Account>accList = new List<Account>();
    List<Contact>conList = new List<Contact>();
    List<Opportunity>oppoList = new List<Opportunity>();
    
    for(Lead lead:System.Trigger.new) {
        
        if (lead.Status == 'Closed - Converted'){
            
            Account ac = new Account();    
            ac.Name = lead.Company;
            ac.Phone = lead.Phone;
            ac.Rating = lead.Rating;
            ac.Website = lead.Website;
            ac.Fax = lead.Fax;
            accList.add(ac);
                
            Contact con = new Contact();
            con.AccountId = ac.Id;
            con.Salutation = lead.Salutation;
            con.FirstName =lead.FirstName;
            con.LastName = lead.LastName;
            con.MobilePhone = lead.Phone;
            con.Email = lead.Email;
            con.MailingStreet = lead.Street;
            con.MailingCity = lead.City;
            con.MailingState = lead.State;
            con.MailingCountry = lead.Country;
            con.MailingPostalCode = lead.PostalCode;
            conList.add(con);
        
        	Opportunity oppo = new Opportunity();
            oppo.AccountId = ac.Id;
            oppo.Name = lead.Company + '-' + con.FirstName + ' ' + con.LastName;
            oppo.CloseDate = System.today() + 20;
            oppo.StageName = 'Prospecting';
            oppo.LeadSource = lead.LeadSource;
        	oppoList.add(oppo);
  }
 }
    insert accList;
    insert conList;
    insert oppoList;*/
    List<Id> leadIdList = new List<Id>();
    for(Lead lead :(List<Lead>)trigger.new)
    {
        leadIdList.add(lead.Id);
        
    }
    
    List<Payment__c> pay =[SELECT Id,Lead__r.Id FROM payment__c WHERE Payment_Status__c = true and payment__c.Lead__r.Id IN : leadIdList];
    
    set<Id> leadIDSet = new set<Id>();
    
    for (Payment__c payment :pay) {
        leadIDSet.add(payment.Lead__r.Id);
    }
    
    for(Lead lead:Trigger.new) {
        
        if(leadIDSet.contains(lead.id))
        {
            
                Database.LeadConvert lc = new Database.LeadConvert();
                lc.setLeadId(lead.id);
                
                LeadStatus convertStatus = [SELECT Id, MasterLabel FROM LeadStatus WHERE IsConverted=true LIMIT 1];
                lc.setConvertedStatus(convertStatus.MasterLabel);
        }              
    }
    
}