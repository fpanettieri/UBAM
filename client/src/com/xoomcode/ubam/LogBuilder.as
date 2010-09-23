package com.xoomcode.ubam
{
	public class LogBuilder
	{
		private var ubam:UBAM;
		
		public function LogBuilder(ubam:UBAM)
		{
			this.ubam = ubam;
		}
		
		public function build(action:String, detail:String):Log
		{
			var log:Log = new Log();
			log.app = ubam.app;
			log.user = ubam.user;
			log.action = action;
			log.detail = detail;
			log.time = formattedDate();
			return log;
		}
		
		private function formattedDate():String
		{
			var dt:Date = new Date();
			return dt.getFullYear() + "-" + dt.getMonth() + "-" + dt.getDate() + " " + 
				dt.getHours() + ":" +	dt.getMinutes() + ":" +	dt.getSeconds();
		}
		
	}
}
