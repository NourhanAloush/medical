class DropTableMedical < ActiveRecord::Migration
  def change
  	drop_table :table_medical_exams
  	drop_table :medical_exams
  end
end
