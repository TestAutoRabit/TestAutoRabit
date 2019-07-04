trigger Accounttrigger1 on Account (before insert, after update) {
 
 for (Account a: trigger.new){
       List <Contact> listcon = [SELECT phone from Contact where AccountId = :a.id];
       
       for(Contact con: listcon)
       {
          con.phone = a.phone;
          
       }
       
       update listcon;
       
     }
    
}