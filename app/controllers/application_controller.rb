class ApplicationController < ActionController::Base
  
  before_filter :set_current_user
  protect_from_forgery with: :exception
  include SessionsHelper
   
   def set_current_user
      User.current = current_user
   end
end
