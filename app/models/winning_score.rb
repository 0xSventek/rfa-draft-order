class WinningScore < ActiveRecord::Base
  belongs_to :team
  belongs_to :mlb_game_score
  
  def self.scan
    MlbGameScore.where(scanned: false).each do |game|
      if game.team_1_score == 10
        create team_id: game.team_1_id, mlb_game_score_id: game.id, twitter_timestamp: game.twitter_timestamp
      end
      
      if game.team_2_score == 10
        create team_id: game.team_2_id, mlb_game_score_id: game.id, twitter_timestamp: game.twitter_timestamp
      end
      
      game.update_attributes(scanned: true)
    end
  end
end
