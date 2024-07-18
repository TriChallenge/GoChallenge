class OutdoorSessionsController < ApplicationController
  before_action :authenticate_user!

  def new
    @outdoor_session = OutdoorSession.new
  end

  def create
    @outdoor_session = current_user.outdoor_sessions.build(outdoor_session_params)
    if @outdoor_session.save
      redirect_to root_path, notice: "Outdoor session started successfully"
    else
      render :new
    end
  end

  def edit
    @outdoor_session = current_user.outdoor_sessions.find(params[:id])
  end

  def update
    @outdoor_session = current_user.outdoor_sessions.find(params[:id])
    if @outdoor_sessions.update(outdoor_session_params)
      redirect_to root_path, notice: "Outdoor session updated successfully"
    else
      render :edit
    end
  end

  private

  def outdoor_session_params
    params.require(:outdoor_session).permit(:start_time, :end_time, :duration, :description)
  end
end
