global class NewBatchClass implements Database.Batchable<sObject>{
  
   global final String query;
   global final String entity;
   global final String field;
   global final String value;
   
   global NewBatchClass(String s,String q,String e, String v)
   {
     query=q;
     entity=e;
     value=v;
     field=s;
   }
   
   global Database.QueryLocator start(Database.BatchableContext BC)
   {
     return Database.getQueryLocator(query);
   }
   
   global void execute(Database.BatchableContext BC,List<sObject> scope){
      for(Sobject s : scope){
         s.put(Field,Value);
         }      
         update scope;
         }

   
   global void finish(Database.BatchableContext BC)
   {}
   
   }