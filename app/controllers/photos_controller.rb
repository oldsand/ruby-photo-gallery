class PhotosController < ApplicationController

  def show
    @photo = Photo.find params[:id]
  end

  def new
    @album = Album.find params[:album_id]
    @photo = @album.photos.new
  end

  def create
    @album = Album.find params[:album_id]
    @photo = @album.photos.new photo_params
    if @photo.save
      redirect_to @photo
    else
      redirect_to :new
    end
  end

  protected

  def photo_params
    params.require(:photo).permit(:title, :attachment)
  end
end
