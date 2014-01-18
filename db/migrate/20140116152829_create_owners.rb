class CreateOwners < ActiveRecord::Migration
  def change
    create_table :owners do |t|
      t.string :name
      t.string :franchise
      t.integer :team_id

      t.timestamps
    end
  end
end
