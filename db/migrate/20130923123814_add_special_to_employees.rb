class AddSpecialToEmployees < ActiveRecord::Migration
  def change
  	add_column :employees, :special, :string
  end
end
