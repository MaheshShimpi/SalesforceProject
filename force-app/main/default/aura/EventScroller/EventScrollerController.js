({
	doInit : function(component, event, helper) {
		//setInterval(function(){ tick () }, 5000);
	},
    tick: function(){
        //$('#ticker li:first').slideUp( function () { $(this).appendTo($('#ticker')).slideDown(); });
    },
    loadEvents : function(component, event, helper) {
        var action = component.get("c.getEvents");
        action.setCallback(this, function(response){
            if(response.getState()==="SUCCESS" && component.isValid()){
                component.set("v.events",response.getReturnValue());
            }
        });
       $A.enqueueAction(action);
    },
    loadActiveEvents : function(component, event, helper) {
        var action = component.get("c.getActiveEvents");
        action.setCallback(this, function(response){
            if(response.getState()==="SUCCESS" && component.isValid()){
                component.set("v.aevents",response.getReturnValue());
            }
        });
       $A.enqueueAction(action);
    },
    loadInactiveEvents : function(component, event, helper) {
        var action = component.get("c.getInactiveEvents");
        action.setCallback(this, function(response){
            if(response.getState()==="SUCCESS" && component.isValid()){
                component.set("v.ievents",response.getReturnValue());
            }
        });
       $A.enqueueAction(action);
    },
    openModel: function(component, event, helper) {
      // Set isModalOpen attribute to true
       debugger;
        var test = event.getSource().get('v.value');
       console.log('22'+event.getSource().get('v.name'));
        var action = component.get("c.getEventdetails");
        //action.setParams({"eid" : event.getSource().get('v.value')});
        action.setParams({
            eid: event.getSource().get('v.name')
        });
        action.setCallback(this, function(response){
            //alert('hi'+response.getReturnValue());
            component.set("v.eventModalInfo",response.getReturnValue());
            //alert('hie');
        });
        $A.enqueueAction(action);
      component.set("v.isModalOpen", true);
      
   },
  
   closeModel: function(component, event, helper) {
      // Set isModalOpen attribute to false  
      component.set("v.isModalOpen", false);
   },
  
   submitDetails: function(component, event, helper) {
      // Set isModalOpen attribute to false
      //Add your code to call apex method or do some processing
      component.set("v.isModalOpen", false);
   },
})