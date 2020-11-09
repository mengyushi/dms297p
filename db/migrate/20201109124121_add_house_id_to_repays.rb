class AddHouseIdToRepays < ActiveRecord::Migration[5.2]
    def change
      add_column :repays, :house_id, :integer
    end
end