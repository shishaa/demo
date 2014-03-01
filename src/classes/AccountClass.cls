public class AccountClass {
//Check Commit 1 for git1

//commit 2 git2
///test
//commit 2
//hihhi
//change in child @local2
//change intest @github
  List<Opportunity> accounts= new List<Opportunity>();

    public AccountClass(ApexPages.StandardController controller)
     {
       accounts=[Select StageName from Opportunity];

     }
    
      public List<Opportunity> getaccounts ()
      {
       return accounts;
      }
       public void setaccounts(List<Opportunity> accounts) 
       {
            this.accounts= accounts;
       } 

}