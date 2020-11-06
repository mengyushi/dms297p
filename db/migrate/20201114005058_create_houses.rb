class CreateHouses < ActiveRecord::Migration[5.1]
    def change
      create_table :houses do |t|
        t.string :name
        t.string :currency
        t.float :rent
        t.float :balance
 
        t.timestamps
      end
    end
end