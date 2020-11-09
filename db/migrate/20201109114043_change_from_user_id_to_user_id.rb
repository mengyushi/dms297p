class ChangeFromUserIdToUserId < ActiveRecord::Migration[5.1]
    def change
       rename_column :questions, :from_user_id, :user_id
    end
end