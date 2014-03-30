class MlbGameScore < ActiveRecord::Base
  belongs_to :team_1, class_name: "Team", foreign_key: :team_1_id
  belongs_to :team_2, class_name: "Team", foreign_key: :team_2_id
  
  @@initial_tweet_id    = "450127810552926208"
  
  def self.get_new_tweets
    
    newest_tweet_id = MlbGameScore.all.blank? ? @@initial_tweet_id : MlbGameScore.order(twitter_status_id: :desc).first.twitter_status_id
    puts " => Getting all tweets since #{newest_tweet_id}"
    errors = []
    tweets = TWITTER_CLIENT.user_timeline('SimpleMLBScores', {:count => 200, :include_rts => false, :since_id => newest_tweet_id})
    tweets.each do |t|
      begin
        save_tweet(t)
      rescue
        errors << {t.id => t.text}
      end
    end

    unless errors.blank?
      puts "=> Errors"
      errors.each{|e| puts e}
    end
  end
  
  def self.get_all_tweets
    puts " => Getting all tweets ever"
    errors = []
    TwitterScores.get_all_tweets('SimpleMLBScores').each do |t|
      begin
        save_tweet(t)
      rescue
        errors << {t.id => t.text}
      end
    end

    unless errors.blank?
      puts "=> Errors"
      errors.each{|e| puts e}
    end
  end
  
  def self.save_tweet(tweet)
    x = tweet.text.gsub(/(T|t)he\s/,"").split(" won ")
    y = x[1].split(" over ")
    z = y[1].split(".")
    
    team_1            = Team.where(last_name: x[0]).first
    team_2            = Team.where(last_name: z[0]).first
    team_1_score      = y[0].split(" - ")[0].to_i
    team_2_score      = y[0].split(" - ")[1].to_i
    
    game_score = where(twitter_status_id: tweet.id.to_s)
    create(team_1_id: team_1.id, team_2_id: team_2.id, team_1_score: team_1_score, team_2_score: team_2_score, twitter_status_id: tweet.id, twitter_timestamp: tweet.created_at) if game_score.blank?
  end
end
