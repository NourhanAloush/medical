class ChangeEmployeeId < ActiveRecord::Migration
  def change
  	change_column :employees, :employee_id, :string
  end
end
