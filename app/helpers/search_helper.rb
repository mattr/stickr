module SearchHelper

  def photo_tag(id)
    info = flickr.photos.getInfo(photo_id: id) rescue nil
    
    return content_tag :figure do
      image_tag(FlickRaw.url_b(info), title: info.title, "data-id": id) + 
      content_tag(:caption, info.title)
    end if info
    content_tag :figure do
      image_tag("http://placehold.it/120x120/?text=Not Found") + 
      content_tag(:caption, "Photo not found")
    end
  end
  
end
