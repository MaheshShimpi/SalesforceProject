({
    doInit: function(component, event, helper) {
        var action = component.get("c.getContactList");
        action.setParams({
            accountid: component.get("v.recordId"),
        });
        action.setCallback(this, function(response) {
            var retValue = response.getReturnValue();
            component.set("v.contactList", retValue);

        }, 'SUCCESS');
        $A.enqueueAction(action, false);
    },
    doRedirect: function(component, event, helper) {
        var eventSource = event.getSource();
        var id = eventSource.get("v.name");
        console.log("working");
        var navEvt = $A.get("e.force:navigateToSObject");
        navEvt.setParams({
            "recordId": id,
            "slideDevName": "detail",
        });
        navEvt.fire();
    },
    handleCompEvent: function(component, event, helper) {
        alert('HEllo event working');
        var avalableContact = component.get("v.contactList");
        var contactRecord = event.getParam("ContactRecord");
        console.log("Contact " + contactRecord);
        avalableContact.push(contactRecord);
        component.set("v.contactList", avalableContact);
    }
})