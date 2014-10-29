package MyApp.Controller
{
	import MyApp.Model.ImageUrlListProxy;
	import MyApp.MyAppFacade;
	import MyApp.View.ControlBtnsMediator;
	import MyApp.View.ImageMediator;
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;

	public class StartUpCommand extends SimpleCommand implements ICommand
	{
		public function StartUpCommand()
		{
			super();
		}		
		override public function execute(notification:INotification):void
		{
			var app:HelloPureMVC = notification.getBody() as HelloPureMVC;
			//注册代理(proxy)
			facade.registerProxy( new ImageUrlListProxy( ImageUrlListProxy.NAME ) );
			//注册中介器
			facade.registerMediator( new ImageMediator( 
			       ImageMediator.NAME, 
			       {
			       	 image:app.image,
			       	 nameLabel:app.nameLabel
			       }
			) );
			
			facade.registerMediator( new ControlBtnsMediator(
			        ControlBtnsMediator.NAME ,
			        {
			        	btnNext:app.btnNext,
			        	btnPrev:app.btnPrev
			        }
			) );
			//通知已经初始化完毕
			sendNotification(MyAppFacade.APP_STARTUP_OVER,app);				
		}
		
	}
}