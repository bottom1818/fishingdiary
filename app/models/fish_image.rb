class FishImage < ApplicationRecord
  belongs_to :caught_fish

  mount_uploader :image, ImageUploader
end
