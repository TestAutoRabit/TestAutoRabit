public class c2{

 string Keyword;
 List<Account> lst;
 
 public List<Account> getActs(){
 return lst;
 }
 
 public String getKeywords(){
 return Keyword;
 }
 
 public PageReference search(){
 lst= (List<Account>)[FIND :Keyword in ALL Fields RETURNING Account(Name, Type, Industry)][0];
 return null;
 }
 
 public void setKeywords(String s){
 Keyword = s;
 }
 }