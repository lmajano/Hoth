/** Unit test for Hoth.HothTracker */
component extends="mxunit.framework.TestCase"
{

	/** Constructor */
	public void function setUp()
	{
		// Load our test config
		HothConfig = new HothConfig();

		return;
	}

	// -------------------------------------------------------------------------
	public void function Confirm_Default_Storage()
	{
		// Confirm the global settings themselves
		assertEquals(
			 '/Hoth/db/'
			,HothConfig.getGlobalDatabasePath()
			,'Has the default location to store application knowledge changed?'
		);

		return;
	}
}