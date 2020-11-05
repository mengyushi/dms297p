class ChangeUserUserNameToUser < ActiveRecord::Migration[5.1]
    def change
       rename_column :users, :user_name, :name
    end
end