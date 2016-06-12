class AlbumsController < ApplicationController

  before_action :authenticate_user!, except: :show

  def index
    @albums = current_user.albums.all
  end

  def show
    @album = Album.find params[:id]

    has_permission = false
    if @album.is_public || @album.user == current_user
      has_permission = true
    end
    redirect_to new_user_session_url unless has_permission
  end

  def new
    @album = current_user.albums.new
  end

  def create
    @album = current_user.albums.new album_params
    if @album.save
      redirect_to @album
    else
      render :new
    end
  end

  def cover_photo
    @album = Album.find params[:album_id]
    photo = @album.cover_photo
    respond_to do |format|
      format.html
      format.jpg { redirect_to @album.cover_photo.attachment.url }
      format.png { redirect_to @album.cover_photo.attachment.url }
    end
  end

  def set_cover_photo
    @album = current_user.albums.find params[:album_id]
    photo = @album.photos.find params[:photo_id]
    unless photo.nil?
      @album.cover_photo_id = photo.id
      @album.save
    end

    redirect_to photo
  end

  def toggle_public_status
    @album = current_user.albums.find params[:album_id]
    @album.is_public = !@album.is_public
    @album.save
    redirect_to @album
  end

  protected

  def album_params
    params.require(:album).permit(:name)
  end

end
