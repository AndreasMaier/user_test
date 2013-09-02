class CreateUniverses < ActiveRecord::Migration
  def change
    create_table :universes do |t|
      t.string :name, :null => false

      t.timestamps
    end
  end
end
