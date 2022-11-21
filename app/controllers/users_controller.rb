class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      redirect_to new_user_path, alert: "Please fill out all the boxes and use an unregistered email address in order to register."
    end
  end 

  private
  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :password, 
      :password_confirmation 
    )
  end
end
