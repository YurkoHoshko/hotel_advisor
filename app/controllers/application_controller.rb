class ApplicationController < ActionController::Base
  protect_from_forgery

  def after_sign_in_path_for(resource)
   hotels_path
  end

  def after_sign_out_path_for(resource_or_scope)
    hotels_path
  end
end
