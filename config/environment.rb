# Load the Rails application.
require File.expand_path('../application', __FILE__)

Time::DATE_FORMATS[:default] = "%d/%m/%Y %l:%M%p"

# Initialize the Rails application.
Rails.application.initialize!
