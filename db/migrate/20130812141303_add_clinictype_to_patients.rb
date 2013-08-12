class AddClinictypeToPatients < ActiveRecord::Migration
  def change
    add_column :patients, :clinic_type, :string
    add_column :patients, :string, :string
  end
end
