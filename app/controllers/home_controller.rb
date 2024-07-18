class HomeController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  def index
    if user_signed_in?
      @outdoor_session = OutdoorSession.new
      @current_session = current_user.outdoor_sessions.find_by(end_time: nil)
      @sessions = current_user.outdoor_sessions.where.not(end_time: nil)
      @total_time = @sessions.sum(:duration)
      @days_passed = (Date.today - Date.today.beginning_of_year).to_i 
      @average_per_day = @total_time / @days_passed
      @days_remaining = (Data.today.end_of_year - Date.today).to_i 
      @required_per_day = (1000 - @total_time) / @days_remaining
      @pace = (@average_per_day * 365).round(2)
    end
  end
end
