class GenresController < ApplicationController
  
  def new
    @genre = Genre.new
  end
  
  def create
    @genre = Genre.new(genre_params)
    @genre.save
  end
  
  def index
    @genre = Gnere.all
  end
  
  def edit
    @genre = Genre.find(params[:id])
  end
  
  def update
    @genre = Genre.find(params[:id])
    @genre.update(genre_params
)
  end
  
  private
  
  def genre_params
    params.require(:genre).permit(:item_id,:name)
  end
end
