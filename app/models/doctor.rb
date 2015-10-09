class Doctor < ActiveRecord::Base
  belongs_to :treatable. polymorphic: true

  validates :dr_name, presence: :true
end
