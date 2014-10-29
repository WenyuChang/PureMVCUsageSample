package MyApp.Model
{
	import MyApp.Model.VO.ImageUrlVO;
	import org.puremvc.as3.interfaces.IProxy;
	import org.puremvc.as3.patterns.proxy.Proxy;

	public class ImageUrlListProxy extends Proxy implements IProxy
	{
		public static const NAME:String = "ImageUrlListProxy";
		
		//定义一些Notification字符常量
		public static const URL_LOAD_COMPLETE:String = "url_load_complete";
		
		public function ImageUrlListProxy(proxyName:String=null, data:Object=null)
		{			
			super(proxyName,data);
		}		
		public function loadUrlList():void{			
			data = new Array();
			//push六张图片的Url
			data.push(new ImageUrlVO("http://www.mjbox.com/r/io/ioryioryzhan/pic1.jpg","卡莫"));
			data.push(new ImageUrlVO("http://www.mjbox.com/r/io/ioryioryzhan/pic2.jpg","李时珍"));
			data.push(new ImageUrlVO("http://www.mjbox.com/r/io/ioryioryzhan/pic3.jpg","姚明"));
			data.push(new ImageUrlVO("http://www.mjbox.com/r/io/ioryioryzhan/pic4.jpg","费得了"));
			data.push(new ImageUrlVO("http://www.mjbox.com/r/io/ioryioryzhan/pic5.jpg","伍兹"));
			data.push(new ImageUrlVO("http://www.mjbox.com/r/io/ioryioryzhan/pic6.jpg","不认得"));	
			//通知image Url已经全部得到了
			if(data==null)trace("data is null");
			sendNotification( URL_LOAD_COMPLETE	,data );					
		}			
	}
}