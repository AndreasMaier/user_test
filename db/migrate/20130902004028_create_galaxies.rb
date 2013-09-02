class CreateGalaxies < ActiveRecord::Migration
  def change
    create_table :galaxies do |t|
      t.integer :cluster_id, :null => false
      t.string :name, :null => false

      t.timestamps
    end
  end
end
