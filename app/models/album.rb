class Album < ActiveRecord::Base
  has_many :photos

  def cover_photo
    return nil if cover_photo_id.nil?
    photos.find cover_photo_id
  end
end
