class EnrollmentsController < ApplicationController

    def index 
        @enrollment = Enrollment.all
    end
    
    def new
        @enrollment = Enrollment.new
    end
    
    
    def show
        @event = Event.find(params[:id])
         @event.attendees << current_user
         redirect_to @event
    end

    def create
        
    end



end
