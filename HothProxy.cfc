component {
	
	/**
	Remote method to allow you to log JavaScript errors which are typically
	trapped by the window.onerror method 
	**/
	remote any function logClientSideError( message, url, linenumber ) returnFormat="plain" {
		
		var HothTracker = getHothTracker();
		var logged = false;
		
		if ( IsObject( HothTracker ) ) {
			var exception = {
				detail = '[#arguments.url# (#arguments.linenumber#)] #arguments.message#',
				type = 'clientside',
				tagContext = '[#arguments.url# (#arguments.linenumber#)]',
				// stack is used to identify unique errors so include lots of info!
				StackTrace = SerializeJSON( arguments ),
				Message = arguments.message
			};
			return HothTracker.track( exception );
			
			logged = true;
		} 
		return logged ? "true" : "false"; // quote to ensure js compatible case
	}
	
	
	private any function getHothTracker() {
		try {
			return new Hoth.HothTracker();
		}
		catch (any e) {
			return '';
		}
	}
}