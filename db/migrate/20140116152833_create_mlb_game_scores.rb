class CreateMlbGameScores < ActiveRecord::Migration
  def change
    create_table :mlb_game_scores do |t|
      t.integer   :team_1_id
      t.integer   :team_2_id
      t.integer   :team_1_score
      t.integer   :team_2_score
      t.string    :twitter_status_id
      t.datetime  :twitter_timestamp
      t.boolean   :scanned, default: false

      t.timestamps
    end
    add_index :mlb_game_scores, :team_1_id
    add_index :mlb_game_scores, :team_2_id
    add_index :mlb_game_scores, :twitter_status_id
  end
end
