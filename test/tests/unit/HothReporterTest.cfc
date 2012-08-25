/**
	Aaron Greenlee
	http://aarongreenlee.com/

	This work is licensed under a Creative Commons Attribution-Share-Alike 3.0
	Unported License.

	// Original Info -----------------------------------------------------------
	Author			: Aaron Greenlee
	Created      	: 02/18/2011

	Unit Test for HothReporter

	// Modifications :---------------------------------------------------------
*/

import mockbox.system.testing.*;

/** Unit test for Hoth.HothTracker */
component extends="mxunit.framework.TestCase"  {

	/** Constructor */
	public void function setUp() {
		MockBox = new MockBox();

		// Load our test config
		UnitTestHothConfig = new HothConfig();
		
		UnitTestHothConfig.setHothReportURL('UNIT_TEST_EXPECTED_VALUE');
		
		// SUT
		SUT = new Hoth.HothReporter(UnitTestHothConfig);

		return;
	}

	// ------------------------------------------------------------------------------
	/** Test default ColdFusion exception tracking. */
	public void function getReportView() {

		local.view = SUT.getReportView();

		local.position = find('UNIT_TEST_EXPECTED_VALUE',local.view,1);

		assert(
			 local.position > 0
			,'The configured URL was not inserted within the report HTML.'
		);
		return;
	}
}