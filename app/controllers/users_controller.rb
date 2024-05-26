class UsersController < ApplicationController
  def new
    session[:current_time] = Time.now
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to root_path, notice: 'Вы успешно зарегистрировались!'
    else
      flash.now[:alert] = 'Вы неправильно заполнили поля формы регистрации'      
      render :new 
    end
  end

  def edit
    @user = User.find(params[:id]) 
  end

  private

  def user_params
    params.require(:user).permit(
      :name,:nickname,
      :email, :password,
      :password_confirmation)
  end

end
