class ApplicationController < ActionController::Base
    helper_method :current_user

    def current_user
        if session[:actor_id]
            Actor.find_by(id: session[:actor_id])
        elsif session[:director_id]
            Director.find_by(id: session[:director_id])
        elsif session[:casting_director_id]
            CastingDirector.find_by(id: session[:casting_director_id])
        end
    end
end
