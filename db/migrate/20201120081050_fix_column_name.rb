class FixColumnName < ActiveRecord::Migration[5.1]
    def change
      change_table :messages do |t|
        t.rename :from, :from_id
        t.rename :to, :to_id
      end  	
    end
  end