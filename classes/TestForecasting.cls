@isTest

public class TestForecasting{

static testmethod void insertuser(){
 user u = new User();
 u.Username='pul@sas.com';
 u.firstname = 'David';
 u.Lastname = 'Soni';
 u.Email= 'jjj@salesforce.com';
 u.alias= 'ass';
 u.TimezoneSidKey='America/Denver';
 u.LocaleSidKey='en_US';
 u.EmailEncodingKey='UTF-8';
 u.LanguageLocaleKey='en_US';
 u.ProfileId='00e90000001R5df';
 u.CommunityNickname='dhjdjd';
 
 insert u;
 }
 }