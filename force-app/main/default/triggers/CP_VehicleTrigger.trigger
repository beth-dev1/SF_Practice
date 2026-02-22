trigger CP_VehicleTrigger on CP_Vehicle__c (before insert) {
    for (CP_Vehicle__c vehicle : Trigger.new) {
        if (vehicle.CP_Status__c == null) {
            vehicle.CP_Status__c = 'Active';
        }
    }
}