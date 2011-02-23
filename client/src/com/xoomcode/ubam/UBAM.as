package com.xoomcode.ubam
{
	// FACADE
	public class UBAM
	{
		// Singleton instance
		private static var _instance:UBAM = new UBAM();

		// Singleton members
		private var logging:Boolean = false;
		private var queue:LogQueue;
		private var dispatcher:LogDispatcher;
		private var builder:LogBuilder;
		
		public var server:String = "http://localhost/ubam";
		public var app:String = "Unknown";
		public var user:String = "Unknown";
		public var interval:int = 60;
		
		public function UBAM()
		{
			if (_instance != null){
				  throw new Error("Singleton instantiation");
			}
			queue = new LogQueue();
			dispatcher = new LogDispatcher(this, queue);
			builder = new LogBuilder(this);
		}

		/**
		 * Start logging user events
		 * This function should be called whenever
		 */
		public static function start():void
		{
			_instance.logging = true;
			_instance.dispatcher.start();
		}

		/**
		 * Pause event logging
		 * Events won't be logged while paused, but queued events aren't lost.
		 */
		public static function pause():void
		{
			_instance.logging = false;
			_instance.dispatcher.stop();
		}
		
		/**
		 * Stop event logging
		 * Queued events are flushed
		 */
		public static function stop():void
		{
			_instance.logging = false;
			_instance.dispatcher.stop();
			_instance.queue.clear();
		}
		
		public static function log(action:String, detail:String):void
		{
			if(_instance.logging){
				_instance.queue.push(_instance.builder.build(action, detail));
			}
		}
		
		public static function flush():void
		{
			_instance.dispatcher.flush();
		}
		
		public static function set server(server:String):void
		{
			_instance.server = server;
		}
		
		public static function set app(app:String):void
		{
			_instance.app = app;
		}
		
		public static function set user(user:String):void
		{
			_instance.user = user;
		}
		
		public static function set interval(interval:int):void
		{
			_instance.interval = interval;
		}
		
	}
	
}

