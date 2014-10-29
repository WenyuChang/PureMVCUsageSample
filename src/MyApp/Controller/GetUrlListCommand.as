package MyApp.Controller
{
	import MyApp.Model.ImageUrlListProxy;
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;

	public class GetUrlListCommand extends SimpleCommand implements ICommand
	{
		public function GetUrlListCommand()
		{
			super();
		}
		
		override public function execute(notification:INotification):void
		{
			//得到图片链接
			(facade.retrieveProxy( ImageUrlListProxy.NAME ) as ImageUrlListProxy).loadUrlList();		
		}
		
	}
}