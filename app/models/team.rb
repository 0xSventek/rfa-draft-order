class Team < ActiveRecord::Base
  has_one :owner
  has_one :result
  
  def logo_src
    if Rails.env == "production"
      src = self.first_name.downcase + " " + self.last_name.downcase
      "/logos/" + src.gsub(".","").gsub(" ","_") + ".png"
      asset_path src
    else
      src = self.first_name.downcase + " " + self.last_name.downcase
      "/assets/logos/" + src.gsub(".","").gsub(" ","_") + ".png"
    end
  end
  
  def self.randomize
    teams = Team.all.collect{|t| t.id}.shuffle.last(12)
    Owner.all.each do |o|
      o.update_attributes team_id: teams.pop
    end
  end
  
end
