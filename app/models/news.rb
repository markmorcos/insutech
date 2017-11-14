class News < ActiveRecord::Base
  validates_presence_of :title, :description

  mount_uploader :image, ImageUploader
  
  default_scope { order("created_at desc") }
  
  def to_s
    title
  end
  
  def attributes
    super.merge({ image_url: image.url })
  end
end
