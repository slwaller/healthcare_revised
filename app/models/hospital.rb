class Hospital < ActiveRecord::Base
  has_many :patients
  has_many :doctors, as: :treatable

  validates :name, presence: true
  validates :description, presence: true
  validates :address, presence: true
end
