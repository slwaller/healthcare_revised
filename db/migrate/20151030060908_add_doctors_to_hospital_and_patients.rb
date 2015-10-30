class AddDoctorsToHospitalAndPatients < ActiveRecord::Migration
  
  def change
    add_column :doctors, :treatable_type, :string
    add_column :doctors, :treatable_id, :integer
  end
end