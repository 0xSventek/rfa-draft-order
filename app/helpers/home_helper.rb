module HomeHelper
  
  def winner_text(winner)
    game          = winner.mlb_game_score
    winning_team  = winner.mlb_game_score.team_1
    losing_team   = winner.mlb_game_score.team_2
    owner         = winner.team.owner
    
    if owner.team == winning_team
      %Q(The #{winning_team.last_name} beat the #{losing_team.last_name} #{game.team_1_score} - #{game.team_2_score} for <b>#{owner.name}</b> <span class="pull-right text-info">on #{link_to winner.twitter_timestamp.strftime('%b %e'), "/standings/#{winner.twitter_timestamp.year}/#{winner.twitter_timestamp.month}/#{winner.twitter_timestamp.day}" }</span>).html_safe
    else
      %Q(The #{losing_team.last_name} lost to the #{winning_team.last_name} #{game.team_1_score} - #{game.team_2_score} for <b>#{owner.name}</b> <span class="pull-right text-info">on #{link_to winner.twitter_timestamp.strftime('%b %e'), "/standings/#{winner.twitter_timestamp.year}/#{winner.twitter_timestamp.month}/#{winner.twitter_timestamp.day}" }</span>).html_safe
    end
    
  end
end
