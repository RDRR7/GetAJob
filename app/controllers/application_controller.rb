class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    if not current_user.nil?
      user_pages_home_path
    elsif not current_company.nil?
      if current_company.company_information.nil?
        new_company_company_information_path(current_company)
      else
        company_pages_home_path
      end
    end
  end
end
