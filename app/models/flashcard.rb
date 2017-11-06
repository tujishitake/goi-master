class Flashcard < ApplicationRecord
  belongs_to :deck, inverse_of: :flashcards
  
  FlickRaw.api_key = ENV['FLICKRAW_API_KEY']
  FlickRaw.shared_secret = ENV['FLICKRAW_SHARED_SECRET']

  
  # validates :deck_id, presence: true 
  validates :text1, presence: true, length: { maximum: 255 }
  validates :text2, presence: true, length: { maximum: 255 }
  
  # def photos
  #   # photo = flickr.photos.search(text: text1, sort: "relevance", per_page: 1).first
  #   # getFlickrImageURL(photo, "q")
    
  #   photos = flickr.photos.search(text: text1, sort: "relevance", per_page: 12)
  #   images = []
  #   photos.each do |photo|
  #     image = getFlickrImageURL(photo, "q")
  #     images.push(image)
  #   end
  #   return images
  # end
  
  # def getFlickrImageURL(photo, size) 
  #   # photoオブジェクトから画像のURLを作成して返す
  #   url = "https://farm" + photo.farm.to_s + ".staticflickr.com/" + photo.server.to_s + "/" + photo.id.to_s + "_" + photo.secret.to_s
  #   if (size)   # サイズ指定ありの場合
  #     url += "_" + size.to_s
  #   end
  #   url += ".jpg"
  #   return url
  # end
end
