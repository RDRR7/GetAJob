class StaticPagesController < ApplicationController
  before_action :authenticate_user!, only: [:dashboard]
  def home
  end

  def dashboard
  end

  private
  def authenticate_user!
    return authenticate_company!
    super
  end
end
