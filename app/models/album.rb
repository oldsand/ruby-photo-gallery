class Album < ActiveRecord::Base
  has_many :photos
  belongs_to :user

  def cover_photo
    return nil if cover_photo_id.nil?
    photos.find cover_photo_id
  end
end
