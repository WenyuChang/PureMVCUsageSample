package MyApp.View
{
	import mx.controls.Alert;
	import mx.controls.Image;
	import mx.controls.Label;
	
	import MyApp.Model.ImageUrlListProxy;
	import MyApp.Model.VO.ImageUrlVO;
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;

	public class ImageMediator extends Mediator implements IMediator
	{
		public static const NAME:String = "ImageMediator";
		
		private var arrayOfImage:Array=null; 
		private var currentIndex:int=-1;
		
		public function ImageMediator(mediatorName:String=null, viewComponent:Object=null)
		{
			super(mediatorName, viewComponent);
		}
		
		
		override public function listNotificationInterests():Array{
			//列出感兴趣的Notification
			return [
			  ImageUrlListProxy.URL_LOAD_COMPLETE,
			  ControlBtnsMediator.NEXT_IMAGE,
			  ControlBtnsMediator.PREV_IMAGE		
			];
		}	
		
		override public function handleNotification(notification:INotification):void{			
			switch(notification.getName()){
				case ImageUrlListProxy.URL_LOAD_COMPLETE:		
					arrayOfImage = notification.getBody() as Array;   
					if(arrayOfImage){
						trace(arrayOfImage.length);
						trace((viewComponent.nameLabel as Label).text);
						(viewComponent.nameLabel as Label).text = (arrayOfImage[0] as ImageUrlVO).name;
						(viewComponent.image as Image).source = (arrayOfImage[0] as ImageUrlVO).url;
						currentIndex = 0;
					}else{
						Alert.show("没有得到图片链接","错误");
					}
					
				break;	
				case ControlBtnsMediator.NEXT_IMAGE:
				    if(currentIndex==-1)break;
				    if(currentIndex >= arrayOfImage.length-1 ){Alert.show("已经是最后一张图片了","错误");}
				    else{
				    	trace((viewComponent.nameLabel as Label));
				    	(viewComponent.nameLabel as Label).text = (arrayOfImage[currentIndex+1] as ImageUrlVO).name;
						(viewComponent.image as Image).source = (arrayOfImage[currentIndex+1] as ImageUrlVO).url;
						++currentIndex;
				    }				    
				break;
				case ControlBtnsMediator.PREV_IMAGE:
				if(currentIndex==-1)break;
				if(currentIndex ==0 ){Alert.show("目前是第一张图片","错误");}
				    else{
				    	(viewComponent.nameLabel as Label).text = (arrayOfImage[currentIndex+-1] as ImageUrlVO).name;
						(viewComponent.image as Image).source = (arrayOfImage[currentIndex-1] as ImageUrlVO).url;
						--currentIndex;
				    }
				break;			
				default:break;
			}			
		}					
	}
}