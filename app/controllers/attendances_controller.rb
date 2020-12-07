class AttendancesController < ApplicationController
  def new
    @event_attended = current_user.attendances.build
  end

  def create
    @event_attended = current_user.attendances.build
    @event_attended.attended_event_id = params[:event_id]

    if @event_attended.save
      redirect_to root_path, notice: 'Attendance registered'
    else
      redirect_to root_path, notice: @event_attended.errors.full_messages
    end
  end

  private

  def attendance_params
    params.require(:attendances).permit(:attended_event_id, :attendee_id)
  end
end
