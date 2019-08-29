({
    doSave: function(component, event, helper) {
        var action = component.get("c.createContact");
        action.setParams({
            con: component.get('v.CreateContact'),
            accountId: component.get('v.accountID')
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            // alert(state);


            if (state === "SUCCESS" || state === "DRAFT") {
                var retval = response.getReturnValue();
                var componentEvent = component.getEvent('quickContact');
                componentEvent.setParams({
                    ContactRecord: retval
                });
                componentEvent.fire();
            } else if (state === "INCOMPLETE") {

            } else if (state === "ERROR") {
                var errors = response.getError();
                console.log("Erros : " + errors[0].duplicateResults);
                console.log("Erros : " + errors[0].fieldErrors);
                console.log("Erros : " + errors[0].pageErrors);
                if (errors || errors[0].message) {

                }
            }
        }, 'ALL');
        $A.enqueueAction(action);
    }
})