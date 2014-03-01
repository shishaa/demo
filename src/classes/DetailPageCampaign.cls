public class DetailPageCampaign {

    public DetailPageCampaign(ApexPages.StandardController controller) {

    }
    
    Campaign currentrecord;
     
     public Campaign getcurrentrecord(){
         currentrecord = [select Id from campaign where Id= :ApexPages.currentPage().getParameters().get('Id')];
         System.debug('***********');
        return currentrecord;
     }
     public void setcurrentrecord(Campaign currentrecord){
        this.currentrecord=currentrecord;
     }
     

}