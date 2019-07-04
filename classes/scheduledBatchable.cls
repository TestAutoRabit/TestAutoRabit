global class scheduledBatchable implements Schedulable {
   global void execute(SchedulableContext sc) {
   
   String q = 'SELECT Industry FROM Account LIMIT 10';

String e = 'Account';

String f = 'Industry';

String v = 'Consulting';

Id batchInstanceId = Database.executeBatch(new NewBatchClass(q,e,f,v), 5);
scheduledBatchable m = new scheduledBatchable();
String sch = '* 1 * * * *';
String jobID = system.schedule('Merge Job', sch, m);


   }
}