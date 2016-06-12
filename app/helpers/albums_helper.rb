module AlbumsHelper

  def public_status(album)
    (album.is_public) ? "🌏 Public" : "🔒 Private"
  end
end
