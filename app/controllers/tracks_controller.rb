class TracksController < ApplicationController
  def new
    @track = Track.new()
    @current_album = Album.find(params[:album_id])
  end
  
  def create
    @track = Track.new(track_params)
    if @track.save
      redirect_to track_url(@track)
    else
      render :new
    end
  end
  
  def edit
    @track = Track.find(params[:id])
  end
  
  def show
    @track = Track.find(params[:id])
  end
  
  def destroy
    @track =  Track.find(params[:id])
    @track.destroy!
    redirect_to :index
  end
  
  def update
    @track =Track.find(params[:id])
    if @track.update_attributes(track_params)
      redirect_to track_url(@track)
    else
      render :edit
    end
  end
  
  private
  def track_params
    params.require(:track).permit(:track_name, :album_id)
  end
end
