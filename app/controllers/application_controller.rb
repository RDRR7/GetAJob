class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    if not current_user.nil?
      user_pages_home_path
    else
      company_pages_home_path
    end
  end
end
