class PhotosController < ApplicationController
  def index
  end

  def show
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    if @photo.save
      redirect_to @photo
    else
      redirect_to :new
    end
  end

  protected

  def photo_params
    params.require(:photo).permit(:titile, :attachment)
  end
end
