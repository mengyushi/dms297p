class DeleteDescriptionFromQuestions < ActiveRecord::Migration[5.1]
    def change
      remove_column :questions, :description
    end
end