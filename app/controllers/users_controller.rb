class UsersController < ApplicationController

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to user_my_page_path(@user)
  end

  def confirm
    @user = current_user
  end

  def withdraw
    @user = User.find(current_user.id)
    @user.update(is_active: 1) #1で退会済みの論理削除
    reset.session
    redirect_to root_path
  end

  private

  def user_params
   params.require(:user).parmit(:first_name, :last_name, :first_name_kana, :last_name_kana, :email, :is_active)
  end

end
