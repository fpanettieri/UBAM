class Log < ActiveRecord::Base
  belongs_to :app
  belongs_to :user
  belongs_to :action
end
