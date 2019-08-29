({
	closeModel: function(component, event, helper) {
      // for Hide/Close Model,set the "isOpen" attribute to "Fasle"  
      component.set("v.CreateCase", false);
          
   },
    create : function(component, event, helper) {
        debugger;
		console.log('Create record');
       // var urls=window.location.href;
      // urls=urls.split("/Case")[1] + "/Case" 
	//urls=urls.split('/')[1]
    
    
        //getting the candidate information
        var Status = component.find("Status").get("v.value");
        var recordId=component.get("v.recordId");
        var action = component.get("c.createRecord");
        
        //Setting the Apex Parameter
        action.setParams({
            "Status":Status,
            //"recordId": component.get("v.recordId")
              "recordId": recordId 
        });
        
        //Setting the Callback
        action.setCallback(this,function(a){
            //get the response state
            var state = a.getState();
            
            //check if result is successfull
            if(state == "SUCCESS"){
                 component.set("v.CreateCase", false);
                var newCaseId = a.getReturnValue()
                                
                var urlEvent = $A.get("e.force:navigateToURL");
                 var urls=window.location.href;
                urlEvent.setParams({
                   
                   "url": urls 
                    //"url": "/500/"+newCaseId+"/"
                });
                urlEvent.fire();
                
                $A.get('e.force:refreshView').fire();
            } else if(state == "ERROR"){
                alert('Error in calling server side action');
            }
        });
        
		//adds the server-side action to the queue        
        $A.enqueueAction(action);

	}
})