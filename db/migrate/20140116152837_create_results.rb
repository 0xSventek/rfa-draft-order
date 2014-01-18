class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.integer :team_id
      t.integer :position

      t.timestamps
    end
    add_index :results, :team_id
  end
end
