class CreateDiseases < ActiveRecord::Migration
  def change
    create_table :diseases do |t|
    	t.string :name
      t.string :emp_id
    end
  end
end
