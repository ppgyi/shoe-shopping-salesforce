public with sharing class OrderManager {

    @AuraEnabled
    public static void setOrder(List<MyProduct__c> products){
        MyOrder__c order = new MyOrder__c(Order_Amount__c=0);
        insert order;
        
        Decimal orderAmount = 0;
        
        for(MyProduct__c product : products){
            MyOrder_line_item__c oli = new MyOrder_line_item__c(Order__c=order.Id, Product__c=product.Id);
            insert oli;
            orderAmount += product.Price__c;
        }
        
        order.Order_Amount__c = orderAmount;
        upsert order;
    }
}