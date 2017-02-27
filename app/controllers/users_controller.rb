class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params

    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'Welcome!'
    else
      render :new
      flash.now[:alert] = 'Please fix error below'
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update user_params
      redirect_to root_path
    else
      flash.now[:alert] = 'Please fix errors below'
      render :edit
    end
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

  # def authorize
  #   if cannot?(:manage, @user)
  #     redirect_to root_path, alert: 'Not authorized!'
  #   end
  # end

end
