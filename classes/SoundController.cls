public with sharing class SoundController {
    @AuraEnabled
    public static List<SoundClip__c> displaySounds()
    {
        return [select name, set__c from SoundClip__c order by name];
    }
}