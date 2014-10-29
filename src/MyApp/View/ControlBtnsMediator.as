package MyApp.View
{
	import flash.events.MouseEvent;
	
	import mx.controls.Button;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.patterns.mediator.Mediator;

	public class ControlBtnsMediator extends Mediator implements IMediator
	{
		public static const NAME:String = "ControlBtnsMediator";
		
		public static const NEXT_IMAGE:String = "next_image";
		public static const PREV_IMAGE:String = "prev_image";
		
		public function ControlBtnsMediator(mediatorName:String=null, viewComponent:Object=null)
		{
			super(mediatorName, viewComponent);
			(viewComponent.btnPrev as Button).addEventListener(MouseEvent.CLICK,onClickPrev);
			(viewComponent.btnNext as Button).addEventListener(MouseEvent.CLICK,onClickNext);
		}		
		private function onClickPrev(e:MouseEvent):void{
			sendNotification(PREV_IMAGE);
		}
		private function onClickNext(e:MouseEvent):void{
			sendNotification(NEXT_IMAGE);
		}

	}
}