package com.xoomcode.ubam
{
	public class UBAM
	{
		// Singleton instance
		private static var _instance:UBAM = new UBAM();

		// Singleton members
		private var logging:Boolean = false;
		private var queue:LogQueue = new LogQueue();
		private var dispatcher:LogDispatcher = new LogDispatcher();
		
		public var server:String = "http://localhost/ubam";
		public var app:String = "Unknown";
		public var user:String = "Unknown";
		public var frequency:int = 60;
		
		public function UBAM()
		{
			if (_instance != null){
				  throw new Error("Singleton instantiation");
			}
		}

		/**
		 * Start logging user events
		 * This function should be called whenever
		 */
		public static function start():void
		{
			_instance.logging = true;
			//
		}

		/**
		 * Pause event logging
		 * Events won't be logged while paused, but queued events aren't lost.
		 */
		public static function pause():void
		{
			_instance.logging = false;
		}
		
		/**
		 * Stop event logging
		 * Queued events are flushed
		 */
		public static function stop():void
		{
			_instance.logging = false;
			// clean events
		}
		
		public static function log(action:String, detail:String):void
		{
			if(_instance.logging){
				_instance._log(action, detail);
			}
		}
		
		public function _log(action:String, detail:String):void
		{
			// create new Log
			// push it to the queue
		}

	}
}

