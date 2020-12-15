module EventsHelper
  def event_params
    params.require(:event).permit(:name, :description, :date)
  end

  def logged_in
    @upcoming_events.each do |event|
      render 'attendees/attendence_form', event: event if logged_in?
    end
  end
end
