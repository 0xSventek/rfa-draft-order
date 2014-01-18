TWITTER_CLIENT = Twitter::REST::Client.new do |config|
  config.consumer_key    = "LyhhENcGBQgLYvggzOPtA"
  config.consumer_secret = "ws7yKJK9qCSJbsLEfXKrfMjxw3YCpBoKzdvtzqz70s"
end

class TwitterScores
  def self.collect_with_max_id(collection=[], max_id=nil, &block)
    response = yield max_id
    collection += response
    response.empty? ? collection.flatten : collect_with_max_id(collection, response.last.id - 1, &block)
  end

  def self.get_all_tweets(user)
    collect_with_max_id do |max_id|
      options = {:count => 200, :include_rts => false}
      options[:max_id] = max_id unless max_id.nil?
      TWITTER_CLIENT.user_timeline(user, options)
    end
  end
end