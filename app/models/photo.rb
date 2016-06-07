class Photo < ActiveRecord::Base
  has_attached_file :attachment,
  styles: {
    large: "1200x1200",
    medium: "800x800",
    thumb: "100x100#"
    },
    default_url: "/images/:style/missing.png"

  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
end
