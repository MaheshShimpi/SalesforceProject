public class MixedDMLOperation {
    public static void useFutureethod(){
        Account acc = new Account(Name='ACme');
        insert acc;
        Util.insertUserWithRole('axcx@ddddd.aaaaa.com', 'Mahesh', 'axcx@ddddd.aaaaa.com', 'Shimpi');
    }
    public static void useNoFutureethod(){
        Account acc = new Account(Name='ACme');
        insert acc;
        Util.insertUserWithRole('axcx@ddddd.aaaaa.com', 'Mahesh', 'axcx@ddddd.aaaaa.com', 'Shimpi');   
    }
}