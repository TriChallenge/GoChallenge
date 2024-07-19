class OutdoorSessionsController < ApplicationController
  before_action :authenticate_user!

  def create
    @outdoor_session = current_user.outdoor_sessions.build(outdoor_session_params)

    if @outdoor_session.save
      if params[:outdoor_session][:end_time].present?
        flash[:notice] = "Outdoor session created successfully"
      else
        flash[:notice] = "Outdoor session started successfully"
      end
    else
      flash[:alert] = @outdoor_session.errors.full_messages.join(", ")
    end

    redirect_to root_path
  end

  def update
    @outdoor_session = current_user.outdoor_sessions.find(params[:id])
    if params[:outdoor_session].present?
      update_params = outdoor_session_params
      success_message = "Outdoor session updated successfully"
    else
      update_params = { end_time: Time.current, duration: ((Time.current - @outdoor_session.start_time) / 1.hour).round(2) }
      success_message = "Outdoor session ended successfully"
    end

    if @outdoor_session.update(update_params)
      flash[:notice] = success_message
    else
      flash[:alert] = @outdoor_session.errors.full_messages.join(", ")
    end

    redirect_to root_path
  end

  private

  def outdoor_session_params
    params.require(:outdoor_session).permit(:start_time, :end_time, :duration, :description)
  end
end
