class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.integer :payment_id
      t.integer :from_user_id
      t.text :description

      t.timestamps
    end
  end
end
