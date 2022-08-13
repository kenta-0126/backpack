class GenresController < ApplicationController

  def new
    @genre = Genre.new
    @genres = Genre.all
  end

  def create
    @genre = Genre.new(genre_params)
    @genre.save!
    redirect_to new_genre_path

  end

  def index
    @genres = Genre.all
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
