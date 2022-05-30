class UsersController < ApplicationController

  def show
  end

  def edit
  end

  def update

  end

  def confirm

  end

  def withdraw
  end

  private

  def user_params
   params.require(:user).parmit(:first_name, :last_name, :first_name_kana, :last_name_kana, :email, :is_active)
  end

end
