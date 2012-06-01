/**
	Aaron Greenlee
	http://aarongreenlee.com/

	This work is licensed under a Creative Commons Attribution-Share-Alike 3.0
	Unported License.

	// Original Info -----------------------------------------------------------
	Author			: Aaron Greenlee
	Created      	: 10/01/2010

	Core configuration object for Hoth. This object provides all the
	functionality for a Hoth Config Object. Individual implementations should
	extend this object and provide their own values within the property
	declaration.

	// -------------------------------------------------------------------------
	Modified		: 	12/13/2010 10:04:06 AM by Aaron Greenlee.
					-	Added support for global settings.

*/
component
accessors='true'
{
	/** Construct a configuration object for Hoth. */
	public function init ()
	{
		local.md = getMetadata(this);
		if (!structKeyExists(local.md, 'properties'))
		{
			throw(
				 message='Invalid HothConfig Object.'
				,detail="You have provided a CFC as the HothConfig that does not have any properties of its own. This could happen if you extended another HothConfig, or, just did not put any properties in your HothConfig."
				,type='Hoth.model.CoreConfig.init()'
			);
		}
		
		local.n = arrayLen(local.md.properties);
		for (local.i=1; local.i <= local.n; local.i++) {
			// To allow runtime configurations, we are going to first check to
			// see if a value exists. If not, we will use the default
			local.fn = this['get' & local.md.properties[local.i].name];
			
			if (isNull(local.fn())) {
				local.fn = this['set' & local.md.properties[local.i].name];			
				local.fn(local.md.properties[local.i]['default']);
			}
		}
		
		// Apply defaults if needed
		if (isNull(getLogPathIsRelative()))
		{
			setLogPathIsRelative(false);
		}
		
		return this;
	}

	public void function setGlobalDatabasePath(required string path) {
		variables.GlobalDatabasePath = arguments.path;
	}
	public string function getGlobalDatabasePath() {
		return (structKeyExists(variables, 'GlobalDatabasePath'))
		? variables.GlobalDatabasePath
		: '/Hoth/db/';
	}

	/** Expands a path **/
	public string function getLogPathExpanded ()
	{
		if (!structKeyExists(variables, 'logPathIsRelative')) {
			variables.logPathIsRelative = false;
		}
		return variables.logPathIsRelative ? expandPath( getLogPath() ) : getLogPath() & "~~";
	}

	/** Return a path for Hoth. */
	public string function getPath (name)
	{
		switch (arguments.name) {
			// Sub-Directories
			case 'incidents' :
			case 'exceptions' :
				return getLogPathExpanded() & '/' & lcase(arguments.name);
			break;

			// Files
			case 'exceptionIndex' :
			case 'exceptionReport' :
			case 'exceptionReportActivity' :
				return getLogPathExpanded() & '/' & lcase(arguments.name) & '.log';
			break;
		}
	}
}