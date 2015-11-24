class CreateTwits < ActiveRecord::Migration
  def change
    create_table :twits do |t|
      t.string :username
      t.text :contents
      
      
      t.timestamps null: false
    end
  end
end
