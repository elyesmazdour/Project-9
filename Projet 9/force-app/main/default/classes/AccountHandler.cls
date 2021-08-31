public with sharing class AccountHandler {
    
    public static void batchUpdateAccount(List<Account> accounts){
        List<Account> accountsToUpdate = new List<Account>();
        Map<Id, AggregateResult> sumofTotalAmount = new Map<Id, AggregateResult>([SELECT AccountID, SUM (TotalAmount) 
        FROM Order 
        WHERE AccountID in : accounts GROUP BY AccountID]);

        for(Account acc: accounts){
            Decimal amount = (Decimal)sumofTotalAmount.get(acc.Id).total;
            acc.Chiffre_d_affaire__c = (acc.Chiffre_d_affaire__c !=null)?acc.Chiffre_d_affaire__c:0;
            acc.Chiffre_d_affaire__c = acc.Chiffre_d_affaire__c + amount;
            accountsToUpdate.add(acc);
        }
        update accountsToUpdate;
    } 
}
