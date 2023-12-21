class Product < ApplicationRecord
  belongs_to :brand
  has_many :ratings
  has_many :comments
  has_many :cart_items
  
  #upload image
  mount_uploader :image, ImageUploader

  #Data validation
  validates_presence_of :name, :price, :image
  validates_uniqueness_of :name
  validates :price, presence: true, format: { with: /\A\d+(?:\.\d{2})?\z/ , message: "must have 2 decimal places"}, numericality: { greater_than: 0, less_than: 1000000 }
  validates :discount, format: { with: /\A0\.\d{1,2}\z/, message: "must have 0 followed by up to 2 decimal places" }

   def self.ransackable_attributes(auth_object = nil)
    ["available", "brand_id", "created_at", "description", "discount", "image", "name", "price", "updated_at"]
  end

end
