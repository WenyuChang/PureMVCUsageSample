package MyApp
{
	import MyApp.Controller.GetUrlListCommand;
	import MyApp.Controller.StartUpCommand;
	import org.puremvc.as3.interfaces.IFacade;
	import org.puremvc.as3.patterns.facade.Facade;

	public class MyAppFacade extends Facade implements IFacade
	{
		public static const APP_STARTUP:String = "app_startup";
		public static const APP_STARTUP_OVER:String = "app_startup_over";
		
		public function MyAppFacade()
		{
			super();
		}
		
		public static function getInstance():MyAppFacade{
			if(instance==null) instance = new MyAppFacade();
			return instance as MyAppFacade;
		}									
		override protected function initializeController():void{
			super.initializeController();
			//register some Commands
			registerCommand(APP_STARTUP,StartUpCommand);
			registerCommand(APP_STARTUP_OVER,GetUrlListCommand);
		}
		public function startup(app:Object):void{		
			sendNotification(APP_STARTUP,app);	
		}	
		
	}
}