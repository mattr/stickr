class Query
  include ActiveModel::Model

  attr_accessor :text, :photos, :recent

  def include_recent?
    return @recent
  end

  def initialize(text = "")
    @photos = []
    @text = text
    search_for_photos(text)
  end

  def search_for_photos(text, recent=false)
    if !!text
      @photos = flickr.photos.search(text: text).map(&:id).take(12)
    elsif recent
      @photos = flickr.photos.getRecent().map(&:id)
    end
    @photos
  end
end
