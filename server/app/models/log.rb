class Log < ActiveRecord::Base
  belongs_to :app
  belongs_to :user
  belongs_to :action
  
  def self.parse(json)
  	transaction do
  		bulk = []
			JSON.parse(json).each do |log|
				bulk << Log.new(
					:app => App.find_or_create_by_name(log["app"]), 
					:user => User.find_or_create_by_name(log["user"]), 
					:action => Action.find_or_create_by_name(log["action"]), 
					:detail => log["detail"], 
					:time => log["time"]
				)
			end
    	Log.import bulk
	  end
  end
end

