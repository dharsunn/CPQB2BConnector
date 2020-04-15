@isTest
public class CPQB2BScheduleSyncQuoteLinesTest {
    
    @isTest
    public static void testScheduleBatch() {
        Test.startTest();
            String CRON_EXP = '0 0 0 3 9 ? 2022';
            String jobId = System.schedule('ScheduleSyncQuoteLines', CRON_EXP, new CPQB2BScheduleSyncQuoteLines());
            CronTrigger ct = [SELECT Id, CronExpression, TimesTriggered, NextFireTime FROM CronTrigger WHERE id = :jobId]; 
            System.assertEquals(0, ct.TimesTriggered); 
            System.assertEquals('2022-09-03 00:00:00', String.valueOf(ct.NextFireTime));         
        Test.stopTest();
    }
}