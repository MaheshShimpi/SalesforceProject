public with sharing class EventController {
	@auraEnabled
	public static list<Campaign> getEvents(){
		return [ SELECT Id, Name, Description, EndDate,StartDate, Status,Type,Location__latitude__s, Location__longitude__s,isActive, End_Time__c, Start_Time__c,Address__c, Benefits__c   From Campaign];
	}
    @AuraEnabled
    public static list<Campaign> getActiveEvents(){
        list<Campaign> activeCampaign = new list<Campaign>();
        for(Campaign c :[ SELECT Id, Name, Description, EndDate,StartDate, Status,Type,Location__latitude__s, Location__longitude__s, isActive, End_Time__c, Start_Time__c,Address__c, Benefits__c, Image_URL__c  From Campaign])
        {
            If(c.IsActive){
                activeCampaign.add(c);
            }
        }
        return activeCampaign;
	}
    @AuraEnabled
    public static list<Campaign> getInactiveEvents(){
		list<Campaign> InactiveCampaign = new list<Campaign>();
        for(Campaign c1 :[ SELECT Id, Name, Description, EndDate,StartDate, Status,Type,Location__latitude__s, Location__longitude__s,isActive, End_Time__c, Start_Time__c,Address__c, Benefits__c, Image_URL__c From Campaign])
        {
            If(c1.IsActive == false){
                InactiveCampaign.add(c1);
            }
        }
        System.debug('InactiveCampaign'+InactiveCampaign);
        return InactiveCampaign;
	}
    @AuraEnabled
    public static String saveCampaign (Campaign cc,Double lat1, Double longi1) {
        //System.debug('lat'+lat1);
        //System.debug('longi'+longi1);
        cc.Location__Latitude__s = lat1;
        cc.Location__Longitude__s = longi1;
        //System.debug('latitude'+cc.Location__Latitude__s);
        //System.debug('longitude'+cc.Location__Longitude__s);
        List<Campaign> newCampaigns = new List<Campaign>();
        newCampaigns.add(cc);
        try{
            insert newCampaigns;
            return 'Success';
        }
        catch(Exception e){
            return (e.getMessage());
        }
    }
    @AuraEnabled
    public static Campaign getEventdetails(String eid){
        System.debug('event Id'+eid);
         return [SELECT Id, Name, Description, EndDate,StartDate, Status,Type,Location__latitude__s, Location__longitude__s,isActive, Image_URL__c From Campaign where id =:eid];
        //return eid;
    }
}