class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name
      t.integer :employee_id
      t.string :department
      t.string :blood_group
      t.datetime :date_of_birth
      t.string :Transfer

      t.timestamps
    end
  end
end
