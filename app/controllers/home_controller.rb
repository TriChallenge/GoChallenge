class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @current_session = current_user.outdoor_sessions.find_by(end_time: nil)
    @outdoor_session = OutdoorSession.new
    @sessions = current_user.outdoor_sessions.where.not(end_time: nil).order(start_time: :desc)
    @total_time = @sessions.sum(:duration) || 0
    @average_per_day = @total_time / Date.today.yday
    @required_per_day = (1000 - @total_time) / (365 - Date.today.yday)
    @pace = @total_time / Date.today.yday * 365
  end
end
