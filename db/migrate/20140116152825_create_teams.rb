class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :first_name
      t.string :last_name
      t.string :short_name
      t.string :color_1
      t.string :color_2
      t.string :color_3

      t.timestamps
    end
  end
end
