class Event < ApplicationRecord
  include SearchCop
  
  search_scope :search do
    attributes :spot_name, :start_date, :end_date, :method, :tackle, :bait, :description
    attributes event_option: ['event_option.weather', 'event_option.tide']
    attributes caught_fish: ['caught_fishes.name', 'caught_fishes.tackle', 'caught_fishes.bait']
  end
  
  belongs_to :user
  has_one :event_option, dependent: :destroy
  accepts_nested_attributes_for :event_option
  has_many :caught_fishes, dependent: :destroy
  accepts_nested_attributes_for :caught_fishes
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  validates :spot_name, presence: true
  validates :start_date, presence: true
  validates :method, presence: true
  validates :target, presence: true
end
