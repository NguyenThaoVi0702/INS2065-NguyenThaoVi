class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :stars_rated, presence: true
end
