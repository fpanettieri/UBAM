package com.xoomcode.ubam
{
	public class LogQueue
	{
		private var queue:Array = [];
		
		public function push(log:Log):void
		{
			queue.push(log);
		}
		
		public function clear():void
		{
			queue = [];
		}
		
		public function toJSON():String
		{
			var json:String = "[";
			for each(var log:Log in queue){
				json += log.toJSON() + ",";
			}
			return json.slice(0,-1) + "]";
		}
		
		public function get length():int
		{
			return queue.length;
		}
		
	}
}

