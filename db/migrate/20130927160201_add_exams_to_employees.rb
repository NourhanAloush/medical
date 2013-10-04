class AddExamsToEmployees < ActiveRecord::Migration
  def change
  	add_column :employees, :have_exam, :string
  end
end
