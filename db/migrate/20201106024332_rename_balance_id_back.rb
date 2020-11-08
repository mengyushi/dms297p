class RenameBalanceIdBack < ActiveRecord::Migration[5.1]
    def change
        rename_column :users, :balance_id, :balance
          change_column :users, :balance, :float
    end
end