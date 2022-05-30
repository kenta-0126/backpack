class GenresController < ApplicationController
  def new
  
  end
  
  def create
  
  
  
  end
  
  def index
  
  end
  
  def edit
  
  
  
  end
  
  
  private
  
  def genres_params
    params.require(:genre).permit(:item_id,:name)
  end
end
