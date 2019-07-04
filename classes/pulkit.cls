public class pulkit{

List<Case> c1 = [select EngineeringReqNumber__c, Status, CaseNumber from Case where CaseNumber like '%00%' LIMIT 4];
public List<Case> getc1(){
return c1;
}

List<Account> c2 =[select Name, Type from Account where Name like '%b%'];

public List<Account> getc2(){
return c2;
}
}