class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.integer :patients_id
      t.string :clinic

      t.timestamps
    end
  end
end
