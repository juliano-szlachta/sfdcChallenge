@RestResource(urlMapping='/showMatches/*')
global with sharing class checkMatches {
   
    @HttpGet
    webservice static List<Match__c> getMatch() {
        
        List<Match__c> myList;
        
        try {
            
            myList = [SELECT Id, 
                          Name, 
                          Stage__c, 
                          Home_team__c, 
                          Home_score__c, 
                          Away_team__c, 
                          Away_score__c,
                          Country__c, 
                          City__c, 
                          Tournament__c,
                      	  Starting_at__c
                          FROM Match__c LIMIT 10];           
            
        } Catch(Exception ex) {
            System.debug('Error: ' + ex.getMessage());
        }   
        return myList;
    }
}