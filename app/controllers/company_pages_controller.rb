class CompanyPagesController < ApplicationController
  before_action :authenticate_company!, only: [:home]
  def homepage
  end

  def home
  end
end
