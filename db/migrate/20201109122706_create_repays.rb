class CreateRepays < ActiveRecord::Migration[5.2]
    def change
      create_table :repays do |t|
        t.integer :user_id
        t.integer :to_id
        t.float :amount
        t.boolean :confirmed
  
        t.timestamps
      end
    end
  end