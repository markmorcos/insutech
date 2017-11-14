class Product < ActiveRecord::Base
  has_many :system_products
  has_many :requests

  mount_uploader :image, ImageUploader
  mount_uploader :datasheet, FileUploader
  
  def to_s
    name
  end
  
  def attributes
    super.merge({ image_url: image.url, datasheet_url: datasheet.url })
  end
end
