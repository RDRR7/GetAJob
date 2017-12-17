class UserPagesController < ApplicationController
  before_action :authenticate_user!
  def home
    jobs_prefered_all=Job.where(status: false, age: current_user.user_information.age, gender: current_user.user_information.gender, education: current_user.user_information.education)
    jobs_prefered_education=Job.where(status: false, education: current_user.user_information.education)
    jobs_prefered_age=Job.where(status: false, age: current_user.user_information.age)
    jobs_prefered_gender=Job.where(status: false, gender: current_user.user_information.gender)
    @jobs=(jobs_prefered_all+jobs_prefered_education+jobs_prefered_age+jobs_prefered_gender+Job.where(status: false)).uniq
  end
end
