# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
DeVryEHR::Application.initialize!

DeVryEHR::Application.configure do
	config.action_controller.session_store = :active_record_store
end
# Use ActiveRecord::SessionStore



