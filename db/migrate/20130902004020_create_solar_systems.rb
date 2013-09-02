class CreateSolarSystems < ActiveRecord::Migration
  def change
    create_table :solar_systems do |t|
      t.integer :galaxy_id, :null => false
      t.string :name, :null => false

      t.timestamps
    end
  end
end
