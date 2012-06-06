class ActionLogEntry < ActiveRecord::Base
  attr_accessible :content, :description, :sim_session
end
