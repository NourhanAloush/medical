class CreateTableUsers < ActiveRecord::Migration
  def change
    create_table :table_users do |t|
      t.string :name
      t.string :email
      t.string :mobile
      t.attachment :avatar

      t.timestamps
    end
  end
end
