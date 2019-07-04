trigger OpportunityTrigger on Opportunity (after insert, after update) {
 Map <Id, Task> taskMap = new Map<id, Task>();
 
   
 List <Opportunity> opptyList = new List<Opportunity> ();
    For (Opportunity opp: trigger.new)
    {
        if(opp.StageName == 'Closed Won')
        {
        for(Task t: [SELECT Id, WhoId, whatId, Status FROM Task where isClosed=false and whatId in :Trigger.newMap.keySet()])
        {
        t.status='Completed';
        taskMap.put(t.WhatId, t);
        }
    }
 }
 
List<Task> taskList = new List<Task>();
taskList.addall(taskMap.values());
   update taskList;
}