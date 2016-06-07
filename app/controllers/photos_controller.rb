class PhotosController < ApplicationController
  def index
    @photos = Photo.all.reverse
  end

  def show
    @photo = Photo.find params[:id]
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new photo_params
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
