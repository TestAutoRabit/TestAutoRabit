public class NewBAtchClassExecutor{

//NewBatchClass batch = new NewBatchClass();
//String cronID = System.scheduleBatch(batch, 'job example', 1);
String q = 'SELECT Industry FROM Account LIMIT 10';

String e = 'Account';

String f = 'Industry';

String v = 'Consulting';

Id batchInstanceId = Database.executeBatch(new NewBatchClass(q,e,f,v), 5);



}