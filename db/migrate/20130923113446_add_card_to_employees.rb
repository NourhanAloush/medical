class AddCardToEmployees < ActiveRecord::Migration
  def change
  	add_column :employees, :card, :string
  end
end
