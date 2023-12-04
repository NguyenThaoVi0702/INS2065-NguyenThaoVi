class Product < ApplicationRecord
  belongs_to :brand

  mount_uploader :image, ImageUploader

  validates_presence_of :name, :price, :image
  validates_uniqueness_of :name
  validates :price, presence: true, format: { with: /\A\d+(?:\.\d{2})?\z/ , message: "must have 2 decimal places"}, numericality: { greater_than: 0, less_than: 1000000 }
  validates :discount, format: { with: /\A0\.\d\z/, message: "must have 0 followed by 2 decimal places" }
end
