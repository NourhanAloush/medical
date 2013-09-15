class CreateVaccines < ActiveRecord::Migration
  def change
    create_table :vaccines do |t|
    	
  		t.string :name
      t.string :emp_id
    end
  end
end
