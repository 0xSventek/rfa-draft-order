class HomeController < ApplicationController
  def index
    @date     = Date.today
    @results  = Result.order(position: :asc).reject{|x| x.position.nil? }
    @recent_winners = WinningScore.where(team_id: Owner.all.collect{|o| o.team_id}).order(twitter_timestamp: :desc)
    @non_winners    = Owner.all.select{|o| o.team.result.position.nil? }
    @todays_winner  = @recent_winners.select{|w| w.twitter_timestamp.beginning_of_day == @date.beginning_of_day }
  end
  
  def standings
    @date     = Date.new(params[:year].to_i,params[:month].to_i,params[:day].to_i)
    @results  = Result.for_date(@date)
    @recent_winners = WinningScore.where("twitter_timestamp < '#{@date.end_of_day.to_s(:db)}'").where(team_id: Owner.all.collect{|o| o.team_id}).order(twitter_timestamp: :desc)
    @non_winners    = Owner.all.reject{|o| @results.collect{|r| r.team_id}.include?(o.team_id) }
    @todays_winner  = @recent_winners.select{|w| w.twitter_timestamp.beginning_of_day == @date.beginning_of_day }
    render :index
  end
end
