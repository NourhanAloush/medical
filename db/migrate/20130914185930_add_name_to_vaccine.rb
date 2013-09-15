class AddNameToVaccine < ActiveRecord::Migration
  def change
  	add_column :vaccines, :name, :string
  	add_column :vaccines, :emp_id, :string
  	     
  end
end
