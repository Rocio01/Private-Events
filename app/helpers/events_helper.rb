module EventsHelper
  def event_params
    params.require(:event).permit(:name, :description, :date)
  end
  
  def logged_in
    @upcoming_events.each do |event| 
     if logged_in?
       render 'attendees/attendence_form', event: event
     end 
    end
  end
end
