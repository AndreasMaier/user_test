class CreatePlanetResources < ActiveRecord::Migration
  def change
    create_table :planet_resources do |t|
      t.integer :planet_id
      t.decimal :population,:null => false, default: 0.0
      t.decimal :metal,     :null => false, default: 0.0
      t.decimal :uranium,   :null => false, default: 0.0
      t.decimal :arplax,    :null => false, default: 0.0

      t.decimal :population_rate,:null => false, default: 1.1
      t.decimal :metal_rate,     :null => false, default: 10.0
      t.decimal :uranium_rate,   :null => false, default: 0.0
      t.decimal :arplax_rate,    :null => false, default: 0.0

      t.timestamps
    end
  end
end
