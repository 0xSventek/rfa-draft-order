class CreateWinningScores < ActiveRecord::Migration
  def change
    create_table :winning_scores do |t|
      t.integer :team_id
      t.integer :mlb_game_score_id
      t.datetime :twitter_timestamp

      t.timestamps
    end
    add_index :winning_scores, :team_id
  end
end
