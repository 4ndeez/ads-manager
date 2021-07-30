class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def update
    if @user.update(user_params)
      redirect_to user_path
    else
      redirect_to @user
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :second_name, :email)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
