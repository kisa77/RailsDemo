class WelcomeController < ApplicationController
    def say
    end

    def index
        @events = Person.all
    end
end
