Trigger RollupTrigger on Expense__c(after insert, after delete, after undelete){

   Set<ID> rollupID = new Set<ID>();
   
   if(trigger.isInsert || trigger.isUndelete)
   {
     for(Expense__c expVar: trigger.New)
     {
     rollupID.add(expVar.AccountLookup__c);
     }
   }

    if(trigger.isUpdate)
    {
     for(Expense__c expVar: trigger.Old)
     {
     rollupID.add(expVar.AccountLookup__c);
     }
    }
    
   List<Account> recToUpdateList = new List<Account>();
   //rectoUpdateList = [Select id, RollupSummary__c,(Select id from Expense__r) from Account
                                                                    //where id in :rollupID];
                                                      
   List<Account> recFinalList = new List<Account>();
   
   for(Account acc: [Select id, RollupSummary__c,(Select id from Expenses__r) from Account
                                                                    where id in :rollupID])
   {
     acc.RollupSummary__c = acc.Expenses__r.size();
     recFinalList.add(acc);
   }
   
   update recFinalList;
   

   
     
}