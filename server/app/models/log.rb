class Log < ActiveRecord::Base
  belongs_to :app
  belongs_to :user
  belongs_to :action
  
  def self.parse(json)
  	transaction do
			ActiveSupport::JSON.decode(json).each do |log|
				Log.create(
					:app => App.find_or_create_by_name(log["app"]), 
					:user => User.find_or_create_by_name(log["user"]), 
					:action => Action.find_or_create_by_name(log["action"]), 
					:detail => log["detail"], 
					:time => log["time"]
				)
			end
	  end
  end
end

