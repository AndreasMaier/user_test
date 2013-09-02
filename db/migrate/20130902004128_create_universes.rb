class CreateUniverses < ActiveRecord::Migration
  def change
    create_table :universes do |t|

      t.timestamps
    end
  end
end
