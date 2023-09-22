automatically

public with sharing class VerificationValidationDisbursement {

    public static void verifyDocuments(String fileFormat) {
        if(fileFormat != 'PDF' || fileFormat != 'JPEG') {
            throw new InvalidFileException('Invalid file format');
        }
    }

    public static void validateCreditEvaluation(Double customerIncome, Integer customerAge, Integer creditScore) {
        if(customerIncome < 100000) {
            throw new CreditEvaluationException('Customer income is below minimum threshold');
        }
        if(customerAge < 18 || customerAge > 65) {
            throw new CreditEvaluationException('Customer age is outside of accepted range');
        }
        if(creditScore < 600) {
            throw new CreditEvaluationException('Credit score is below minimum threshold');
        }
    }

    public static void processDisbursement(String vendorBankAccountNumber, String vendorRoutingNumber, Double availableBalance, Double paymentAmount, Boolean paymentApprovalRequired) {
        if(vendorBankAccountNumber.length() != 9 || vendorRoutingNumber.length() != 9) {
            throw new PaymentDisbursementException('Vendor information is invalid');
        }
        if(availableBalance < paymentAmount) {
            throw new PaymentDisbursementException('Insufficient funds for disbursement');
        }
        if(paymentApprovalRequired && !paymentApprovalRequired) {
            throw new PaymentDisbursementException('Payment approval required');
        }
        if(paymentAmount <= 1000.0) {
            System.out.println('Payment to ' + vendorName + ' in the amount of ' + paymentAmount + ' has been automatically approved.');
        } else {
            System.out.println('Payment to ' + vendorName + ' in the amount of ' + paymentAmount + ' has been successfully disbursed.');
        }
    }

    public class InvalidFileException extends Exception {
        public InvalidFileException(String message) {
            super(message);
        }
    }

    public class CreditEvaluationException extends Exception {
        public CreditEvaluationException(String message) {
            super(message);
        }
    }

    public class PaymentDisbursementException extends Exception {
        public PaymentDisbursementException(String message) {
            super(message);
        }
    }

}