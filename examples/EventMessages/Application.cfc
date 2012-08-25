component 
{
	this.name = 'HothEventMessageExample_' & hash(getCurrentTemplatePath());
	
	// Setup a mapping to Hoth. This can be done in the Administrator
	// as well. I am using a relative path here since Hoth is included within
	// the same download/repo as this example.
	this.mappings =
	{
		'/Hoth' = getDirectoryFromPath(getCurrentTemplatePath())
					.ReplaceFirst("([^\\\/]+[\\\/]){1}$", "")
					.ReplaceFirst("([^\\\/]+[\\\/]){1}$", "")  
	};
	
	boolean function onApplicationStart()
	{
		return true;
	}
	
	 boolean function onRequestStart(required string targetPage)
	{
		return true;
	}
	
	boolean function onRequestEnd(required string targetPage)
	{
		return true;
	}
	
	void function onError(required Except,required string EventName)
	{
		
	}
}