class Brand < ApplicationRecord
    validates_presence_of :name, :logo
	validates_uniqueness_of :name

    mount_uploader :logo, ImageUploader
end
