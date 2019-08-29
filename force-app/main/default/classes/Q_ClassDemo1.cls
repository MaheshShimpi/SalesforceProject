public class Q_ClassDemo1 implements System.Queueable{
	public Id parentId;
    public Q_ClassDemo1(Id accId){
        this.parentId = accId;
    }
    public void execute(QueueableContext context){
		Contact con = new Contact(LastName='Contact', FirstName='Queueable', AccountId=this.parentId);
        insert con;
    }
}