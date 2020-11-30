class ApplicationController < ActionController::Base
    before_action :verified_user
    helper_method :current_user


    def verified_user
        unless user_is_authenticated
            flash[:error] = "Please Sign in or Sign up"
            redirect_to '/'
        end
    end

    def user_is_authenticated
        !!current_user
    end

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
