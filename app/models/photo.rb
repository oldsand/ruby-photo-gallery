class Photo < ActiveRecord::Base
  belongs_to :album
  has_one :user, through: :album

  has_attached_file :attachment,
  styles: {
    large: "1200x1200",
    medium: "800x800",
    thumb: "300x300#" # = Crop the image
    },
    default_url: "/images/:style/missing.png"
    url: "/system/:id/:style/:hash/:filename",
    hash_secret: "longSecretString",
    hash_data: ":class/:attachment/:id/:style/:updated_at"

  validates_attachment_content_type :attachment, content_type: /\Aimage\/.*\Z/

  def next_record
    self.album.photos.where('id > ?', id).first
  end

  def prev_record
    self.album.photos.where('id < ?', id).last
  end
end
