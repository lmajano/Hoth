/**
	Hoth Event
	------------------------------------------------------------
	Hoth events provide an easy way to monitor application
	behavior. Events can simply be recorded or a developer can
	write a custom assertions to help Hoth proactivly warn
	as issues occur.
**/
component
	name="Hoth Event"
	accessors=true
	implements="Hoth.model.events.iEvent"
	extends='Hoth.model.events.BaseEvent'  
{
	VARIABLES.FRIENDLY_EVENT_NAME = 'Twitter API Connection Error';
	
	//------------------------------------------------------------------
	// Constructor
	//------------------------------------------------------------------
	
	/** Constructor **/
	public Event function init() { return super.this(); }

	//------------------------------------------------------------------
	// Public Methods
	//------------------------------------------------------------------
	
	/**
		Used by Hoth Reports or scheduled processes to evaluate
		all events of this type.
		
		@Event Accepts Hoth.model.events.Event
	**/
	public struct function assertOne(required Event)
	{
		return super.assertOne(Events=arguments.Events);
	}
	
	/**
		Used by Hoth Reports or scheduled processes to evaluate
		all events of this type. 
	
		@Event Accepts Hoth.model.events.Event[]			
	**/
	public struct function assertMany(required array Events)
	{
		return super.assertMany(Events=arguments.Events);
	}
}