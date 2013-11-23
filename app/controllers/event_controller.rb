class EventController < ApplicationController

    before_filter :find_event, :only => [ :show, :edit, :update ]

    def find_event
        @event = Event.find( params.permit![:id])
    end

    def index
##        @events = Event.all
        @events = Event.page(params.permit![:page]).per(5)
    end

    def show
        respond_to do |format|
            format.html { @page_title = @event.name } # show.html.erb
            format.xml # app/views/event/show.xml.builder
            format.json { render :json => { id: @event.id, name: @event.name, description: @event.description }.to_json }
        end
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

        redirect_to event_url(@event)
    end

    def new
        @event = Event.new
    end

    def create
        Rails.logger.debug("event: #{@event.inspect}")
        @event = Event.new(params.permit![:event])
        @event.save
        Rails.logger.debug("event: #{@event.inspect}")
        flash[:notice] = 'event was successfully created'

        redirect_to event_index_url
    end
end
