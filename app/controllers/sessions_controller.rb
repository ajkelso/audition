class SessionsController < ApplicationController
    def new_actor
        @actor = Actor.new
    end
    
end
