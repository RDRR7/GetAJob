class JobsController < ApplicationController
    before_action :authenticate_company!, only: [:new, :create, :destroy, :update_status]
    def index
        if params[:search]
            info=CompanyInformation.where("name like ?", "%#{params[:search]}%").first
            if not info.nil?
                @jobs=info.company.jobs.where(status: false)
            else
                redirect_to jobs_path, alert: "No match"
            end
        else
            @jobs=Job.all
        end
    end

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
        if current_company.nil? and current_user.nil?
            redirect_to root_path, alert: "You need to sign in or sign up before continuing"
        else
            @job=Job.find(params[:id])
        end
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
