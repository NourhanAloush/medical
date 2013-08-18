class CreateMedicalExams < ActiveRecord::Migration
  def change
    create_table :medical_exams do |t|
      t.string :emp_id
      t.string :exam_type
      t.datetime :exam_time

      t.timestamps
    end
  end
end
