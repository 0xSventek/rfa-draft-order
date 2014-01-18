class Result < ActiveRecord::Base
  belongs_to :team
  
  def self.calculate
    
    r = Team.all.inject({}){|h,t| h.merge(t.id => nil)}
    
    WinningScore.order(twitter_timestamp: :asc).each do |winner|
      
      winning_team_position_before = r[winner.team_id]
      
      if winning_team_position_before.nil?
        r[winner.team_id] = 1
        r.each do |k,v|
          r[k] = v + 1 unless (r[k].nil? || k == winner.team_id)
        end
      else
        r[winner.team_id] = 1
        r.each do |k,v|
          r[k] = v + 1 unless (r[k].nil? || winning_team_position_before < r[k] || k == winner.team_id)
        end
      end
    end
    
    r.each do |k,v|
      result = Result.where(team_id: k).first
      result.update_attributes(position: v) unless v.nil?
    end
    
  end
  
  def self.for_date(date)
    r = Team.all.inject({}){|h,t| h.merge(t.id => nil)}
    
    WinningScore.where("twitter_timestamp < '#{date.end_of_day.to_s(:db)}'").order(twitter_timestamp: :asc).each do |winner|
      
      winning_team_position_before = r[winner.team_id]
      
      if winning_team_position_before.nil?
        r[winner.team_id] = 1
        r.each do |k,v|
          r[k] = v + 1 unless (r[k].nil? || k == winner.team_id)
        end
      else
        r[winner.team_id] = 1
        r.each do |k,v|
          r[k] = v + 1 unless (r[k].nil? || winning_team_position_before < r[k] || k == winner.team_id)
        end
      end
    end
    results = []
    r.each do |k,v|
      results << Result.new(team_id: k, position: v)
    end
    
    return results.sort!{|l,r| l.position.to_i <=> r.position.to_i }.reject{|x| x.position.nil? }

  end
  
end
