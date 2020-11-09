class RenameBalanceId < ActiveRecord::Migration[5.1]
    def change
        rename_column :users, :balance, :balance_id
          change_column :users, :balance_id, :integer
    end
end