class Patient < ActiveRecord::Base
  belongs_to :hospital
  has_many :medications

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :dob,
  date: { before: Proc.new { Date.today }, message: 'Must be valid date' },
  on: :create
  validates :reason, presence: true
  validates :gender, presence: true
end
