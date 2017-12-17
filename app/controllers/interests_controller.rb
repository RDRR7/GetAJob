class InterestsController < ApplicationController
    def create
        job=Job.find(params[:job_id])
        interest=Interest.create(job_id: job.id, user_id: params[:user_id])
        interest.save
        redirect_to job
    end
end
