public with sharing class ProductManager {

    @AuraEnabled(Cacheable=true scope='global')
    public static MyProduct__c[] getProducts(){
        return [SELECT
                Id__c,
                Name,
                Description__c,
                Category__c,
                Color__c,
                Image_URL__c,
                Price__c
                FROM MyProduct__c];            
    }

    @AuraEnabled(Cacheable=true scope='global')
    public static MyProduct__c[] getFilteredProductsByCategory(String filter){
        
        if(filter == null){
            return [SELECT
                Id__c,
                Name,
                Description__c,
                Category__c,
                Color__c,
                Image_URL__c,
                Price__c
                FROM MyProduct__c]; 
        } else {
            return [SELECT
                Id__c,
                Name,
                Description__c,
                Category__c,
                Color__c,
                Image_URL__c,
                Price__c
                FROM MyProduct__c 
                WHERE (Category__c=:filter)]; 
        }                  
    }

    @AuraEnabled(Cacheable=true scope='global')
    public static MyProduct__c[] getFilteredProductsByColor(String filter){
        
        if(filter == null){
            return [SELECT
                Id__c,
                Name,
                Description__c,
                Category__c,
                Color__c,
                Image_URL__c,
                Price__c
                FROM MyProduct__c]; 
        } else {
            return [SELECT
                Id__c,
                Name,
                Description__c,
                Category__c,
                Color__c,
                Image_URL__c,
                Price__c
                FROM MyProduct__c 
                WHERE (Color__c=:filter)]; 
        }                  
    }

    @AuraEnabled(Cacheable=true scope='global')
    public static MyProduct__c[] getFilteredProductsByPrice(Decimal filter){
        
        if(filter == null){
            return [SELECT
                Id__c,
                Name,
                Description__c,
                Category__c,
                Color__c,
                Image_URL__c,
                Price__c
                FROM MyProduct__c]; 
        } else {
            return [SELECT
                Id__c,
                Name,
                Description__c,
                Category__c,
                Color__c,
                Image_URL__c,
                Price__c
                FROM MyProduct__c 
                WHERE (Price__c<:filter)];      
        }          
    }
}