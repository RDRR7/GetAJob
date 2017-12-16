class CategoriesController < ApplicationController
  before_action :authenticate_company!
  def new
    @category=Category.new
  end

  def create
    category=Category.new(category_params)

    if category.save
        redirect_to new_company_job_path(current_company)
    else
        render 'new'
    end
  end

  private
  def category_params
      params.require(:category).permit(:name)
  end
end
