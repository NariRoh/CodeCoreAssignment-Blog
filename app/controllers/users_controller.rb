class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params

    if @user.save
      redirect_to posts_path, notice: 'Welcome!'
    else
      render :new
      flash.now[:alert] = 'Please fix error below'
    end
  end

  def edit
    @user = User.find params[:id]
    # @user = current_user
  end

  # def edit_password
  #   @user = User.find current_user.id
  # end

  # def update_password
  #   @user = User.find current_user.id
  #   if @user.update password_params
  #     redirect_to edit_user_path, notice: 'You password successfully changed!'
  #   else
  #     render :update_password
  #     flash.now[:alert] = 'Check errors below'
  #   end
  # end


  def update
  end

  def destroy
  end

  private

  def user_params
    user_params = params.require(:user).permit(:first_name,
                                               :last_name,
                                               :email,
                                               :password,
                                               :password_confirmation )
  end

  # def password_params
  #   password_params = params.require(:user).permit(:current_password
  #                                                  :new_password
  #                                                  :new_passwrd_confirmation)
  # end
end
