class Product < ApplicationRecord
  validates :name, :price, :description, presence: true
  validates :name, uniqueness: true
  belongs_to :admin_user

  mount_uploader :image, ImageUploader

end
