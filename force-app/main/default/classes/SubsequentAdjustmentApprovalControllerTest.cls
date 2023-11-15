Here are some sample unit test methods for the given class:

@isTest
private class SubsequentAdjustmentApprovalControllerTests {
    
    @isTest
    static void testGetSubsequentAdjustmentCases() {
        // Test the getSubsequentAdjustmentCases method
        List<SubsequentAdjustmentCase> cases = SubsequentAdjustmentApprovalController.getSubsequentAdjustmentCases();
        System.assertEquals(0, cases.size(), 'No subsequent adjustment cases should be retrieved');
        
        // Create test data for subsequent adjustment cases
        List<SubsequentAdjustmentCase> testCases = new List<SubsequentAdjustmentCase>();
        for (Integer i = 0; i < 5; i++) {
            SubsequentAdjustmentCase testCase = new SubsequentAdjustmentCase();
            // Set test case fields
            testCases.add(testCase);
        }
        insert testCases;
        
        // Test the getSubsequentAdjustmentCases method again
        cases = SubsequentAdjustmentApprovalController.getSubsequentAdjustmentCases();
        System.assertEquals(5, cases.size(), '5 subsequent adjustment cases should be retrieved');
    }
    
    @isTest
    static void testGetSubsequentAdjustmentCaseDetails() {
        // Create a test subsequent adjustment case
        SubsequentAdjustmentCase testCase = new SubsequentAdjustmentCase();
        // Set test case fields
        insert testCase;
        
        // Test the getSubsequentAdjustmentCaseDetails method
        SubsequentAdjustmentCase caseDetails = SubsequentAdjustmentApprovalController.getSubsequentAdjustmentCaseDetails(testCase.Id);
        System.assertEquals(testCase.Id, caseDetails.Id, 'The retrieved subsequent adjustment case should match the test case');
    }
    
    @isTest
    static void testUpdateSubsequentAdjustmentCase() {
        // Create a test subsequent adjustment case
        SubsequentAdjustmentCase testCase = new SubsequentAdjustmentCase();
        // Set test case fields
        insert testCase;
        
        // Test the updateSubsequentAdjustmentCase method
        SubsequentAdjustmentApprovalController.updateSubsequentAdjustmentCase(testCase.Id, 'Approved', 'Test comments');
        
        // Retrieve the updated subsequent adjustment case
        SubsequentAdjustmentCase updatedCase = [SELECT Status, Comments FROM SubsequentAdjustmentCase WHERE Id = :testCase.Id];
        System.assertEquals('Approved', updatedCase.Status, 'The subsequent adjustment case should be updated with the new status');
        System.assertEquals('Test comments', updatedCase.Comments, 'The subsequent adjustment case should be updated with the new comments');
    }
    
    // Add more unit test methods for the remaining methods
    
}

Note: Remember to replace "SubsequentAdjustmentCase" with the actual API name of your custom object. Also, make sure to create appropriate test data for each test method and cover various scenarios to ensure the functionality of the class is thoroughly tested.