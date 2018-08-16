class CaughtFish < ApplicationRecord
  belongs_to :event
  has_many :fish_images, dependent: :destroy
  accepts_nested_attributes_for :fish_images
  validates :name, presence: true
  validates :caught_number, presence: true
  validates :caught_number, numericality: true
end
