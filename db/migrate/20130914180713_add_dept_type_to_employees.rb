class AddDeptTypeToEmployees < ActiveRecord::Migration
  def change
  	add_column :employees, :deptType, :string
  end
end
