// Unit Tests
@isTest
public class VerificationValidationDisbursementTest {
    static testmethod void testVerifyDocuments() {
        // test valid file format
        Test.startTest();
        VerificationValidationDisbursement.verifyDocuments('PDF');
        Test.stopTest();
        
        // test invalid file format
        Test.startTest();
        Test.isExpectedException(InvalidFileException.class, () -> VerificationValidationDisbursement.verifyDocuments('TXT'));
        Test.stopTest();
    }

    static testmethod void testValidateCreditEvaluation() {
        // test customer income threshold
        Test.startTest();
        Test.isExpectedException(CreditEvaluationException.class, () -> VerificationValidationDisbursement.validateCreditEvaluation(80000, 20, 700));
        Test.stopTest();
        
        // test customer age range
        Test.startTest();
        Test.isExpectedException(CreditEvaluationException.class, () -> VerificationValidationDisbursement.validateCreditEvaluation(100000, 16, 700));
        Test.stopTest();
        
        // test credit score threshold
        Test.startTest();
        Test.isExpectedException(CreditEvaluationException.class, () -> VerificationValidationDisbursement.validateCreditEvaluation(100000, 20, 500));
        Test.stopTest();
    }

    static testmethod void testProcessDisbursement() {
        // test valid vendor information
        Test.startTest();
        VerificationValidationDisbursement.processDisbursement('123456789', '123456789', 20000, 1000, false);
        Test.stopTest();
        
        // test insufficient funds
        Test.startTest();
        Test.isExpectedException(PaymentDisbursementException.class, () -> VerificationValidationDisbursement.processDisbursement('123456789', '123456789', 20000, 30000, false));
        Test.stopTest();
        
        // test payment approval required
        Test.startTest();
        Test.isExpectedException(PaymentDisbursementException.class, () -> VerificationValidationDisbursement.processDisbursement('123456789', '123456789', 20000, 1000, true));
        Test.stopTest();
    }
}