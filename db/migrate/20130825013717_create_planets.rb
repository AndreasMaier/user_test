class CreatePlanets < ActiveRecord::Migration
  def change
    create_table :planets do |t|
      t.string :name,:null => false
      t.integer :user_id
      t.integer :solar_system_id, :null => false

      t.timestamps
    end
  end
end
