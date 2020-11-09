class AddHouseIdToQuestions < ActiveRecord::Migration[5.1]
    def change
      add_column :questions, :house_id, :integer
    end
end