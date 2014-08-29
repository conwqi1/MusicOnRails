class AlbumsController < ApplicationController
  def new
    @album = Album.new
    @current_band =Band.find(params[:band_id])
  end
  
  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to album_url(@album)
    else
      render :new
    end
  end
  
  def edit
    @album = Album.find(params[:id])
  end
  
  def show
    @album = Album.find(params[:id])
  end
  
  def destroy
    @album =  Album.find(params[:id])
    @album.destroy!
    redirect_to :index
  end
  
  def update
    @album =Album.find(params[:id])
    if @album.update_attributes(album_params)
      redirect_to album_url(@album)
    else
      render :edit
    end
  end
  
  private
  def album_params
    params.require(:album).permit(:album_name, :band_id)
  end
end
