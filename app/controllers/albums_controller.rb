class AlbumsController < ApplicationController

  def index
    @albums = Album.all
  end

  def show
    @album = Album.find params[:id]
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.new album_params
    if @album.save
      redirect_to @album
    else
      render :new
    end
  end

  def set_cover_photo
    @album = Album.find params[:album_id]
    photo = @album.photos.find params[:photo_id]
    unless photo.nil?
      @album.cover_photo_id = photo.id
      @album.save
    end

    redirect_to photo
  end

  protected

  def album_params
    params.require(:album).permit(:name)
  end

end
