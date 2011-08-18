/** Logging interface for request secific logger. **/
interface 
{
	public function init(required Config);
	public function info(required cfc,required string message,details='');
	public function flush();
}