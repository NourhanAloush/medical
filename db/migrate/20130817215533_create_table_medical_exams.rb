class CreateTableMedicalExams < ActiveRecord::Migration
  def change
    create_table :table_medical_exams do |t|
    	create_table(:medical_exams) do |t|
		  t.column :emp_id, :string, limit: 1000
		  t.column :exam_name, :string, limit: 1000
		  t.column :exam_time, :datetime
		end
    end
  end
end
