class CreateSolarSystems < ActiveRecord::Migration
  def change
    create_table :solar_systems do |t|

      t.timestamps
    end
  end
end
