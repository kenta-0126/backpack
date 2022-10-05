class GenresController < ApplicationController
  before_action :authenticate_customer!
  def new
    @user = current_user
    @genre = Genre.new
    @genres = @user.genres
  end

  def create
    @genre = Genre.new(genre_params)
    @genre.save
    redirect_to new_genre_path
  end

  def index
    @user = User.find(params[:id])
    @genres = @user.genres
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    @genre.update(genre_params)
  end

  private

  def genre_params
    params.require(:genre).permit(:name, :item_id).merge(user_id: current_user.id)
  end
end
