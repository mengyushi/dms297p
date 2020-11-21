class CreateSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules do |t|
      t.integer :user_id
      t.integer :house_id
      t.string :title
      t.string :description
      t.string :place

      t.timestamps
    end
  end
end
