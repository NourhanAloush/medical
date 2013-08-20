class AddEmpDateToEmployees < ActiveRecord::Migration
  def change
  	add_column :employees, :emp_date, :date
  	add_column :employees, :mobile, :string
  end
end
