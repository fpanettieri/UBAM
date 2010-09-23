package com.xoomcode.ubam
{
	public class Log
	{
		public var app:String = "";
		public var user:String = "";
		public var action:String = "";
		public var detail:String = "";
		public var time:String = "";
		
		public function toJSON():String
		{
			return '{' +
				"'app':'" + app + "'," +
				"'user':'" + user + "'," +
				"'action':'" + action + "'," +
				"'detail':'" + detail + "'," +
				"'time':'" + time + "'" +
			"}";
		}
	}
}

