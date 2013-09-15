class AddDoneToEmployees < ActiveRecord::Migration
  def change
  	add_column :employees, :done, :string
  end
end
