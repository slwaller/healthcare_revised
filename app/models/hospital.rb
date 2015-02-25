class Hospital < ActiveRecord::Base
  has_many :patients

  validates :name, presence: true
  validates :description, presence: true

  geocoded_by :address
  after_validation :geocode
end
