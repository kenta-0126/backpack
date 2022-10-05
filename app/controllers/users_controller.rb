class UsersController < ApplicationController
  before_action :authenticate_customer!
  def show
    @today = DateTime.now.to_time
    @user = current_user
    @events = @user.events
    @event = @events.min_by{|event| (@today - event.start_time).abs}
    @genres = @user.genres
    @items = @user.item
    @item = Item.where(event_id: @event)
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to users_my_page_path(@user)
  end

  def confirm
    @user = current_user
  end

  def withdraw
    @user = User.find(current_user.id)
    @user.update(is_active: 1) # 1で退会済みの論理削除
    reset_session
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :email, :is_active)
  end
end
