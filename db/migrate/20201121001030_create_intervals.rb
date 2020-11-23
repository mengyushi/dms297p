class CreateIntervals < ActiveRecord::Migration[5.2]
  def change
    create_table :intervals do |t|
      t.integer :user_id
      t.integer :house_id
      t.integer :schedule_id
      t.datetime :start
      t.datetime :end

      t.timestamps
    end
  end
end
