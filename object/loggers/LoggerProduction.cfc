/** A logging object used during development. **/
component
implements="shared.models.objects.loggers.ILogger"
{	
	public function init(required Config)
	{
		variables.messages = [];
		return this;
	}
	
	public function info(required cfc,required string message,details='')
	{
		return;		
	}
	
	public function flush() {
		return;
	}
	
	private function getCFCPath(cfc) {
		return;
	}
}