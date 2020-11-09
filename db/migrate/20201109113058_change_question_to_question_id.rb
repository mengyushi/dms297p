class ChangeQuestionToQuestionId < ActiveRecord::Migration[5.1]
    def change
       rename_column :payments, :question, :question_id
    end
end