@isTest
public with sharing class testDataFactory {

public static void createData (Integer nbreCompte, Integer nombreCommande) {

    List<Account> accounts = new List<Account>();
    List<Order> listOrders = new List<Order>();
    List<OrderItem> listOrderItems = new List<OrderItem>();
    for(Integer i=0; i< nbreCompte; i++){
        Account acc = new Account(Name = 'Account '+i);
         accounts.add(acc);
    }
    insert accounts;

    for(Account acc : accounts){

        for(Integer i= 0; i< nombreCommande; i++){
        Order  o = new Order (AccountId = acc.Id, EffectiveDate = System.today(), Status='Ordered', Pricebook2Id = Test.getStandardPricebookId(), ShipmentCost__c=20);
        listOrders.add(o);
        }
    }
    insert listOrders;

    Product2 produit = new Product2(Name ='Tablette XXX', IsActive = true );
    insert produit;

    PricebookEntry pbe = new PricebookEntry (
        Pricebook2Id = Test.getStandardPricebookId(),
        Product2Id = produit.Id,
        UnitPrice = 1020,
        IsActive = true
    );
    insert pbe;

    for (Order ord : listOrders){

        OrderItem ordI1 = new OrderItem(OrderId = ord.Id, PricebookEntryId = pbe.Id, Quantity =10, UnitPrice = 1000 );
        OrderItem ordI2 = new OrderItem(OrderId = ord.Id, PricebookEntryId = pbe.Id, Quantity =15, UnitPrice = 800 );
        listOrderItems.add(ordI1);
        listOrderItems.add(ordI2);
    }
    insert listOrderItems;

}   
}