class User < ApplicationRecord
  has_many :events
  has_many :favorites, dependent: :destroy
  has_many :favorite_events, through: :favorites, source: :event
  
  before_save { email.downcase! }
  has_secure_password
  
  validates :name,  presence: true, length: { maximum: 255 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :password, presence: true, length: { minimum: 6 }
end
