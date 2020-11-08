class CreatePayments < ActiveRecord::Migration[5.1]
  def change
    create_table :payments do |t|
      t.integer :user_id
      t.integer :house_id
      t.text :description
      t.integer :question
      t.float :amount

      t.timestamps
    end
  end
end