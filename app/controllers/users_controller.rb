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

  def update
    @user = User.find(params[:id]) 

    if @user.update(user_params)
      redirect_to root_path, notice: 'Данные пользователя успешно обновлены.'
    else
      flash.now[:alert] = 'При попытке сохранить пользователя возникла ошибка!'      
      render :edit 
    end
  end

  def destroy
    @user = User.find(params[:id]) 
    @user.destroy

    session.delete(:user_id)

    redirect_to root_path, notice: 'Пользователь удалён.'
  end

  private

  def user_params
    params.require(:user).permit(
      :name, :nickname,
      :email, :password,
      :password_confirmation,
      :password_digest #!!!
      )
  end

end
