public class Q_ClassDemo implements System.Queueable {
    public Account acc;
    public Q_ClassDemo(Account acc){
        this.acc = acc;
    }
    public void execute(QueueableContext context){
        // Account acc = new Account(Name='Queueable Apex Account');
        // insert acc;
        
        this.acc.Name = 'Updated Queueable Account';
        this.acc.industry = 'Education';
        update this.acc;
        Q_ClassDemo1 qClass1 = new Q_ClassDemo1(this.acc.Id);
        if(!Test.isRunningTest()){
            Id batchId1 = System.enqueueJob(qClass1);
        }
		
       /* AsyncApexJob jobinfo = [SELECT Id, CreatedDate, JobType, ApexClassId, Status, TotalJobItems, CompletedDate, MethodName, ParentJobId, NumberOfErrors FROM AsyncApexJob Where Id =: batchId1];
		System.debug('jobinfo2' + jobinfo);*/
    }
}