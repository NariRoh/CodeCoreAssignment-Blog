class PasswordResetsController < ApplicationController
  before_action :matching_password, only: [:create]

  def new
  end

  def create
    if @user.update( password: params[:new_password],
                     password_confirmation: params[:password_confirmation] )
      redirect_to edit_user_path @user, notice: 'Your password changed!'
    else
      flash.now[:alert] = "There was problem updating the user"
      render :new
    end
  end

  private

  def matching_password
    @user = current_user
    unless @user&.authenticate params[:password]
      flash.now[:alert] = "You entered wrong password"
      render :new
      puts "User was not found"
    end
  end

  # def password_params
  #   password_params = params.require(:password).permit(:password,
  #                                                      :password_confirmation)
  # end

end
