namespace :job do 
  desc "This will get the scores from the Twitter account"
  task :get_scores => :environment do
    puts "===" + " RUNNING rake job:get_scores ".ljust(100,"=")
    MlbGameScore.get_new_tweets
    puts "===" + " FINISHED rake job:get_scores "
  end

  desc "This will sift through the score to find when 10 runs are scored"
  task :scan_for_winners => :environment do
    puts "===" + " RUNNING rake job:scan_for_winners ".ljust(100,"=")
    WinningScore.scan
    puts "===" + " FINISHED rake job:scan_for_winners "
  end

  desc "This will calculate the current results"
  task :set_results => :environment do
    puts "===" + " RUNNING rake job:set_results ".ljust(100,"=")
    Result.calculate
    puts "===" + " FINISHED rake job:set_results "
  end
end