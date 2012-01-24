/**
	Hoth Event
	------------------------------------------------------------
	Hoth events provide an easy way to monitor application
	behavior. Events can simply be recorded or a developer can
	write a custom assertions to help Hoth proactivly warn
	as issues occur.
**/
component
	name="Hoth Event (Base)"
	accessors=true  
{
	
	/**
		Unique information for this specific event. 
	**/
	property name='event_message' type='string';
	/**
		A means of grouping many event messages for 
		simple reporting. Common event_type values may include
		'TwitterAPIError' or 'TwitterAPISuccess'.
	**/
	property name='event_type' type='string';
	/**
		A means of identifying where this event originated. Generally,
		this is the hostname of the machine that generated the
		event but it can also be another custom value provided by
		the developer. For example, if using multiple instances
		of ColdFusion on the same server a developer may also wish
		to customize this to include the hostname of the machine
		as well as a means to identify the actual instance of
		ColdFusion runnning on that server.
	**/
	property name='event_origin' type='string'; 
	
	/** A timestamp for the event. **/
	property name='event_timestamp' type='date';
	
	//------------------------------------------------------------------
	// PUBLIC
	//------------------------------------------------------------------
	
	/** Constructor **/
	public Event function init()
	{
		// Provide default values for events
		variables.event_timestamp = now();
		
		var inits = ['event_message','event_type','event_origin'];
		for(var k in inits) variables[k] = '';
		
		return this;
	}
	
	/** Used by Hoth Reports or scheduled processes to evaluate
		all events of this type.
		
		@Event Accepts Hoth.model.events.Event
	**/
	public struct function assertOne(required Event)
	{
		return {
			 'warn' = false
			,'message' = 'None implemented'
		};
	}
	
	/** Used by Hoth Reports or scheduled processes to evaluate
		all events of this type. 
	
		@Event Accepts Hoth.model.events.Event[]			
	**/
	public struct function assertMany(required array Events)
	{
		return super.assertMany(Events=arguments.Events);
	}
}