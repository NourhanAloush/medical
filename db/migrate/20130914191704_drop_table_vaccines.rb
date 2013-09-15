class DropTableVaccines < ActiveRecord::Migration
  def change
  	drop_table :vaccines
  end
end
