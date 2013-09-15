class CreateExams < ActiveRecord::Migration
  def change
    create_table :exams do |t|
      t.string :name
      t.integer :max
      t.integer :min

      t.timestamps
    end
  end
end
