class UserInformationsController < ApplicationController
  before_action :authenticate_user!
  def new
    @user=User.find(params[:user_id])
    @info=@user.build_user_information
  end

  def create
    user=User.find(params[:user_id])
    info=user.build_user_information(user_information_params)

    if info.save
        redirect_to user_pages_home_path
    else
        render 'new'
    end
  end

  def edit
    @user=User.find(params[:user_id])
    @info=@user.user_information
  end

  def update
    user=User.find(params[:user_id])
    info=user.user_information
    if info.update(user_information_params)
      redirect_to user_pages_home_path
    else
      render 'edit'
    end
  end

  def update_status
    info=UserInformation.find(params[:id])
    if info.status
      info.update(status: false)
    else
      info.update(status: true)
      Interest.where(user_id: info.user_id).destroy_all
    end
    redirect_to edit_user_user_information_path(info.user, info)
  end

  private
  def user_information_params
      params.require(:user_information).permit(:name, :contact, :about_me, :age, :gender, :education)
  end
end
