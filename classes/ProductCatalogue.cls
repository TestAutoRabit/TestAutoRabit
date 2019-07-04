public class ProductCatalogue{

public List<Product2> prodRec {get;set;}
public String name{get;set;}
public String Description{get;set;}
public String str = ApexPages.currentPage().getParameters().get('name');
public boolean choosenProduct{get;set;}

public List<selectOption> optionList {get; set;}

List <ProductWrapper> prodList{get;set;}



public ProductCatalogue(){

prodRec = new List<Product2>();
choosenProduct = false;
}


public void AddtoCart(){

prodList = new List <ProductWrapper>(); 
prodList.add (new ProductWrapper(prodRec, choosenProduct));
System.debug('+++++++++++' +prodList);

}


public PageReference searchProducts(){
 if(null!=str) {
    name=str;
    }
string searchstr=('%'+name+'%');

prodRec = [SELECT Id, Name, Description, ProductCode, IsActive, QuantityUnitOfMeasure FROM Product2 where name like :searchstr];

return null; 
}

public class ProductWrapper{
   public List<Product2> prod{get;set;}
   public Boolean selected {get;set;}
   
   public ProductWrapper(List<Product2> p, Boolean sel){
   prod = p;
   selected = sel;
   }
}



}