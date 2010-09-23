package com.xoomcode.ubam
{
	import flash.utils.Timer;
  import flash.events.TimerEvent;
  import flash.net.*;
            
	public class LogDispatcher
	{
		private var ubam:UBAM;
		private var queue:LogQueue;
		private var timer:Timer;
		
		public function LogDispatcher(ubam:UBAM, queue:LogQueue)
		{
			this.ubam = ubam;
		}
		
		public function start():void
		{
			timer = new Timer(ubam.interval);
      timer.addEventListener(TimerEvent.TIMER, updateTimer);
      timer.start();
		}
		
		public function stop():void
		{
			if(timer){
				timer.stop();
				timer = null;
			}
		}
		
		private function updateTimer(evt:TimerEvent):void
		{
			var json:String = queue.toJSON();
			queue.clear();
			
			var request : URLRequest = new URLRequest(ubam.server);  
			request.method = URLRequestMethod.POST; 

			var data : URLVariables = new URLVariables();
			data.log = json;
			request.data = data; 
			
			var loader : URLLoader = new URLLoader();  
			loader.load(request);
		}
		
	}
}

