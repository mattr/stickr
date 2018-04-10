module SearchHelper

  def photo_tag(id)
    info = flickr.photos.getInfo(photo_id: id)
    content_tag :figure do
      image_tag(FlickRaw.url_b(info), title: info.title, "data-id": id) + 
      content_tag(:caption, info.title)
    end
  end
  
end
