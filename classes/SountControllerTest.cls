@isTest(seeAllData=true)
public class SountControllerTest {

    public static testMethod void checkRecords()
    {
        List<SoundClip__c> cList=[select name from soundclip__c];
        List<SoundClip__c> tList=SoundController.displaySounds();
        test.startTest();
        System.assertEquals(cList.size(),tList.size());
        test.stopTest();
          
    }
}