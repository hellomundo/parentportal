class CustomDeviseController < ActionController::Base
  skip_before_action :verify_authenticity_token
  layout "devise"
end
