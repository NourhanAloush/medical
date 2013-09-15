class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :patient_id
      t.string :clinic
      t.string :clinic_type

      t.timestamps
    end
  end
end
