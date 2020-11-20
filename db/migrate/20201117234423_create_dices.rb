class CreateDices < ActiveRecord::Migration[5.2]
  def change
    create_table :dices do |t|
      t.integer :user_id
      t.integer :house_id
      t.integer :result

      t.timestamps
    end
  end
end
