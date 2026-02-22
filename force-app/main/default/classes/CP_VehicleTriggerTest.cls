@isTest
public class CP_VehicleTriggerTest {
    
    @isTest
    
    static void testStatusAutoPopulation() {
        // 1. HAZIRLIK (Data Setup): Status alanı boş olan bir araç oluştur
        CP_Vehicle__c testVehicle = new CP_Vehicle__c(Name = 'Test Aracı');
        
        // 2. İŞLEM (Execution): Aracı veritabanına kaydet (Burada Trigger devreye girecek)
        Test.startTest();
        insert testVehicle;
        Test.stopTest();
        
        // 3. DOĞRULAMA (Verification): Gerçekten 'Active' oldu mu kontrol et
        // Veritabanından güncel halini geri çekiyoruz
        CP_Vehicle__c insertedVehicle = [SELECT CP_Status__c FROM CP_Vehicle__c WHERE Id = :testVehicle.Id];
        
        // Assert: Beklenen değer (Active), gerçek değerle (CP_Status__c) aynı mı?
        System.assertEquals('Active', insertedVehicle.CP_Status__c, 'Status alanı otomatik olarak Active dolmalıydı!');
    }
}
