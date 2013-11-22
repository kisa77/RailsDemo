class EventController < ApplicationController
    def index
        @events = Event.all
    end

    def show
##        @event = Event.where( :id => params.permit![:id]).first

        @event = Event.find( params.permit![:id])
    end

    def edit
        @event = Event.find( params.permit![:id])
    end

    def update
        @event = Event.find( params.permit![:id])
        @event.update_attrbutes(params.permit![:event])

##        redirect_to :action => 'show', :id => @event
##        redirect_to :action => 'index'
    end

    def distory
    end

    def new
        @event = Event.new
    end

    def create
        params.permit!
        @event = Event.new(params[:event])
        @event.save

        redirect_to :action => 'index'
    end
end
