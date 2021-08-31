global  class Batch_UpdateAccountCA  implements Database.Batchable<SObject> {

    global Database.QueryLocator start(Database.BatchableContext ctx) {
        return Database.getQueryLocator(
            'select Id from Account where Id in (select AccountID From Order where Status = \'Ordered\'');
    }
    global void execute(Database.BatchableContext BC, List<Account> accounts ){
      
    }
    global void finish(Database.BatchableContext BC){}
}
