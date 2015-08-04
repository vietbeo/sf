class UsersController < ApplicationController
  include UsersHelper
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    p "entered email:"
    p @user.email
    @user.user_name = extract_username(@user.email)
    if @user.save
      redirect_to @user
    else
      render 'new'
    end
  end
  
  private
    def user_params
      params.require(:user).permit(:display_name, :email, :password,
                                   :password_confirmation)
    end
end
