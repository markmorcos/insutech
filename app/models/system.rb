class System < ActiveRecord::Base
  has_many :systems
  belongs_to :system

  has_many :system_products

  accepts_nested_attributes_for :system_products, allow_destroy: true

  validates_presence_of :name, :full_name

  mount_uploader :image_2d, ImageUploader
  mount_uploader :image_3d, ImageUploader

  def to_s
    name
  end

  def attributes
    super.merge({ image_2d_url: image_2d.url, image_3d_url: image_3d.url })
  end
end
