class UserPagesController < ApplicationController
  before_action :authenticate_user!
  def home
    @jobs=Job.all
  end
end
