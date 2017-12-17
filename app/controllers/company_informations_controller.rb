class CompanyInformationsController < ApplicationController
  before_action :authenticate_company!, except: [:show]
  def new
    @company=Company.find(params[:company_id])
    @info=@company.build_company_information
  end

  def create
    company=Company.find(params[:company_id])
    info=company.build_company_information(company_information_params)

    if info.save
        redirect_to company_pages_home_path
    else
        render 'new'
    end
  end

  def show
    if current_company.nil? and current_user.nil?
      redirect_to root_path, alert: "You need to sign in or sign up before continuing"
    end
    @info=CompanyInformation.find(params[:id])
  end

  def edit
    @company=Company.find(params[:company_id])
    @info=@company.company_information
  end

  def update
    company=Company.find(params[:company_id])
    info=company.company_information
    if info.update(company_information_params)
      redirect_to company_pages_home_path
    else
      render 'edit'
    end
  end

  private
  def company_information_params
      params.require(:company_information).permit(:name, :description, :contact, :location)
  end
end
