class Log < ActiveRecord::Base
  belongs_to :app
  belongs_to :user
  belongs_to :action
  
  def self.parse(json)
	  obj = ActiveSupport::JSON.decode(json)
		Log.create(
	  	:app => App.find_or_create_by_name(obj["app"]), 
	  	:user => User.find_or_create_by_name(obj["user"]), 
	  	:action => Action.find_or_create_by_name(obj["action"]), 
	  	:detail => obj["detail"], 
	  	:time => obj["time"]
	  )
  end
end

