class JobsController < ApplicationController
    before_action :authenticate_company!

    def new
        @company=Company.find(params[:company_id])
        @job=@company.jobs.build
    end

    def create
        company=Company.find(params[:company_id])
        job=company.jobs.build(jobs_params)

        if job.save
            redirect_to company_home_homepage_path
        else
            render 'new'
        end
    end

    def index
        company=Company.find(params[:company_id])
        @jobs=company.jobs
    end

    private
    def jobs_params
        params.require(:job).permit(:description, :age, :gender, :education, :category_id)
    end
end
