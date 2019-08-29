public class Util {
    // @future
    public static void insertUserWithRole(String uname,String al, String em ,String lname){
        Profile p = [SELECT Id FROM Profile WHERE Name='Standard User'];
        UserRole r = [SELECT Id FROM UserRole WHERE Name='COO'];
        // create new user with non null user role id
        User u = new User(
            Alias = al,
            Email = em,
            EmailEncodingKey = 'UTF-8',
            LastName = lname,
            LanguageLocaleKey = 'en_US',
            LocalesidKey = 'en_US',
            ProfileId = p.Id,
            UserRoleId = r.id,
            TimeZonesIdKey = 'America/Los_Angeles',
            UserName = uname
        );
        insert u;
    }
    public static void insertUserWithNoRole(String uname,String al, String em ,String lname){
        Profile p = [SELECT Id FROM Profile WHERE Name='Standard User'];
        // UserRole r = [SELECT Id FROM ProUserRole WHERE Name='COO'];
        // create new user with non null user role id
        User u = new User(
            Alias = al,
            Email = em,
            EmailEncodingKey = 'UTF-8',
            LastName = lname,
            LanguageLocaleKey = 'en_US',
            LocalesidKey = 'en_US',
            ProfileId = p.Id,
            // UserRole = r.id,
            TimeZonesIdKey = 'America/Los_Angeles',
            UserName = uname
        );
        insert u;
    }
}