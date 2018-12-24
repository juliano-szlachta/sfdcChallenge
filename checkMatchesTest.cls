@isTest
public class checkMatchesTest {
    static testmethod void myUnitTest() {
        
        Match__c mt = new Match__c();
        mt.Stage__c = 'Open';
        mt.Home_team__c = 'a031U000003ov6BQAQ';
        mt.Away_team__c = 'a031U000003ov68QAA';
        mt.Home_score__c = 3;
        mt.Away_score__c = 2;
        mt.Country__c = 'Spain';
        mt.City__c = 'Zaragoza';
        mt.Starting_at__c = System.today();
        mt.Tournament__c = 'a001U000002S47LQAS';
        
        insert mt;
        
        Id recordId = mt.Id;
        RestRequest request = new RestRequest();
        request.requestURI = 'https://na85.lightning.force.com/services/apexrest/showMatches/' 
            				 +recordId; 
        request.httpMethod = 'GET';
        RestContext.request = request;
        
        Match__c thisMatch = [SELECT Id, Name From Match__c WHERE Id =: mt.Id];
        System.assert(thisMatch != null);
        system.assertEquals('Match-100078', thisMatch.Name );        
    }    
}