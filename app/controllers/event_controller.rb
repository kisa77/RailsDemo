class EventController < ApplicationController

    before_filter :find_event, :only => [ :show, :edit, :update ]

    def find_event
        @event = Event.find( params.permit![:id])
    end

    def index
##        @events = Event.all
        @events = Event.page(params.permit![:page]).per(2)
    end

    def show
##        @event = Event.find( params.permit![:id])
    end

    def edit
##        @event = Event.find( params.permit![:id])
    end

    def update
##        @event = Event.find( params.permit![:id])
        @event.update_attributes(params.permit![:event])
        flash[:notice] = 'event was successfully created'

        redirect_to :action => 'show', :id => @event
    end

    def destroy
        begin
            @event = Event.find(params.permit![:id])
            @event.destroy
        rescue ActiveRecord::RecordNotFound
            flash[:alert] = "record not found id=#{params.permit![:id]}"
        end

        redirect_to :action => 'index'
    end

    def new
        @event = Event.new
    end

    def create
        @event = Event.new(params.permit![:event])
        @event.save
        flash[:notice] = 'event was successfully created'

        redirect_to :action => 'index'
    end
end
