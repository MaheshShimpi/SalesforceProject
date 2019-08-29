({
    doAdd: function(component, event, helper) {
        var num1 = component.get("v.number1");
        var num2 = component.get("v.number2");
        component.set("v.output", parseInt(num1) + parseInt(num2));
    },
    doSub: function(component, event, helper) {
        var num1 = component.get("v.number1");
        var num2 = component.get("v.number2");
        component.set("v.output", parseInt(num1) - parseInt(num2));
    },
    doMul: function(component, event, helper) {
        var num1 = component.get("v.number1");
        var num2 = component.get("v.number2");
        component.set("v.output", parseInt(num1) * parseInt(num2));
    },
    doDiv: function(component, event, helper) {
        var num1 = component.get("v.number1");
        var num2 = component.get("v.number2");
        component.set("v.output", parseInt(num1) / parseInt(num2));
    }
})