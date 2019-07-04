public class MyController{
Account acc;
public PageReference Save(){
update acc;
return null;
}

public String getName(){
return 'Pulkit';
}

public Account getAccount()
{
if (acc==null)
{acc= [select id, name from Account where id = :ApexPages.currentPage().getParameters().get('id')];}
return acc;
}

 public String[] getStrings() {
        return new String[]{'ONE','TWO','THREE'};
    }
           


    String[] countries = new String[]{};
        String[] countries2 = new String[]{};
 
    public PageReference test() {
        return null;
    }
    
    public PageReference merge1() {
        return null;
    }    
 
    public List<SelectOption> getItems() {
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('US','US'));
        options.add(new SelectOption('CANADA','Canada'));
        options.add(new SelectOption('MEXICO','Mexico'));

        return options;
    }
 
    public String[] getCountries() {
        return countries;
    }
 
    public void setCountries(String[] countries) {
        this.countries = countries;
    }
    public String[] getCountries2() {
        return countries2;
    }
 
    public void setCountries2(String[] countries2) {
        this.countries2 = countries2;
    }
    



}