public class AccountTrigger2Handler {
    public static void updateOpportunity(List<Account> newList){
        set<id> updatedAcc=new set<id> ();
        List<Opportunity> relatedOpp=new List<Opportunity> ();
        List<Opportunity> OppToUpdated=new List<Opportunity> ();
        for(Account acc: newList){
            updatedAcc.add(acc.id);
        }
        DateTime day30=system.now()-30;
        relatedOpp=[select Id,AccountId,CloseDate,StageName,CreatedDate from Opportunity where Id in: updatedAcc];
        if(relatedOpp!= null){
            for(Opportunity opp:relatedOpp){
                if(opp.CreatedDate<day30 && opp.StageName!='Closed Won'){
                    opp.StageName='Closed Lost';
                    opp.CloseDate=System.today();
                    OppToUpdated.add(opp);
                    opp.StageName='Closed Lost';
                    opp.CloseDate=System.today();
                    OppToUpdated.add(opp);
                    system.debug("Hello");
                }
            }
        }
        if(OppToUpdated!=null){
            update OppToUpdated;
        }
        
        
    }
    
}