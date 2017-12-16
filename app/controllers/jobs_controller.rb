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
            redirect_to company_pages_home_path
        else
            render 'new'
        end
    end

    def show
        @job=Job.find(params[:id])
    end

    def index
        company=Company.find(params[:company_id])
        @jobs=company.jobs
    end

    def destroy
        Job.find(params[:id]).destroy
        redirect_to company_pages_home_path
    end

    def update_status
        job=Job.find(params[:id])
        if job.update(status: true)
            redirect_to company_pages_home_path
        end
    end

    private
    def jobs_params
        params.require(:job).permit(:description, :age, :gender, :education, :category_id)
    end
end
