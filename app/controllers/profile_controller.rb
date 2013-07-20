class ProfileController < ApplicationController

  before_filter :authenticate_user!

  # GET: просмотр профиля
  def show
    # Тут ничего не делаем, используем current_user
  end

  # GET: форма редактирования пользователя
  def edit
    # Тут ничего не делаем, используем current_user
  end

  # PUT: сохранение измененных данных пользователя
  def save
    if current_user.update_attributes params[:user].permit(:email, :first_name, :last_name, :avatar)
      redirect_to profile_show_path, notice: 'Saved'
    else
      #redirect_to profile_show_path, alert: current_user.errors.full_messages[0]
      render 'edit'
end

  end

end
