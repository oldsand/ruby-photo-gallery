class Photo < ActiveRecord::Base
  has_attached_file :attachment,
  styles: {
    large: "1200x1200",
    medium: "800x800",
    thumb: "100x100#" # = Crop the image
    },
    default_url: "/images/:style/missing.png"

  validates_attachment_content_type :attachment, content_type: /\Aimage\/.*\Z/

  def next_record
    Photo.where('id > ?', id).first
  end

  def prev_record
    Photo.where('id < ?', id).last
  end
end
