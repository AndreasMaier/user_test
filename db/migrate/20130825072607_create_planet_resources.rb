class CreatePlanetResources < ActiveRecord::Migration
  def change
    create_table :planet_resources do |t|
      t.integer :planet_id
      t.decimal :population, default: 0.0
      t.decimal :metal, default: 0.0
      t.decimal :uranium, default: 0.0
      t.decimal :arplax, default: 0.0

      t.decimal :population_rate, default: 1.1
      t.decimal :metal_rate, default: 10.0
      t.decimal :uranium_rate, default: 0.0
      t.decimal :arplax_rate, default: 0.0

      t.timestamps
    end
  end
end
