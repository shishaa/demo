/**
 * This class contains unit tests for validating the behavior of Apex classes
 * and triggers.
 *
 * Unit tests are class methods that verify whether a particular piece
 * of code is working properly. Unit test methods take no arguments,
 * commit no data to the database, and are flagged with the testMethod
 * keyword in the method definition.
 *
 * All test methods in an organization are executed whenever Apex code is deployed
 * to a production organization to confirm correctness, ensure code
 * coverage, and prevent regressions. All Apex classes are
 * required to have at least 75% code coverage in order to be deployed
 * to a production organization. In addition, all triggers must have some code coverage.
 * 
 * The @isTest class annotation indicates this class only contains test
 * methods. Classes defined with the @isTest annotation do not count against
 * the organization size limit for all Apex scripts.
 *
 * See the Apex Language Reference for more information about Testing and Code Coverage.
 */
@isTest
global class MockHttpResponseGeneratorTestClass implements HttpCalloutMock
{

    static testMethod void myUnitTest() 
    {
        // TO DO: implement unit test
    }
    
    // Implement this interface method
		global HTTPResponse respond(HTTPRequest req)
		 {
		 	LeadManipulatorApexRESTService.RT rt;
		 	String s=JSON.serialize(rt);
		// Optionally, only send a mock response for a specific endpoint
		// and method.
		System.assertEquals('https://ap1.salesforce.com/00Q', req.getEndpoint());
		//https://ap1.salesforce.com/services/apexrest/Lead/?FirstName=Abishek&LastName=Bacchan&Email=H@g.com&Phone=3333
		System.assertEquals('POST', req.getMethod());
		//System.assertEquals('PATCH', req.getMethod());
		// Create a fake response
		HttpResponse res = new HttpResponse();
		res.setHeader('Content-Type', 'application/json');
		//res.setBody('{"00Q":""}');
		res.setBody('{string}');
		res.setStatusCode(200);
		return res;
		}
		
}