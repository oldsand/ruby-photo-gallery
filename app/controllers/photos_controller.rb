class PhotosController < ApplicationController

  before_action :authenticate_user!, except: :show

  def show
    @photo = Photo.find params[:id]

    has_permission = false
    if @photo.album.is_public || @photo.album.user == current_user
      has_permission = true
    end
    unless has_permission
      redirect_to new_user_session_url
      return
    end
    
    render layout: "photo-view"
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
