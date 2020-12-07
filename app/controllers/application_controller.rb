class ApplicationController < ActionController::Base
    before_action :verified_user
    helper_method :current_user
    helper_method :owner?
    helper_method :current_user_model


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
            @current_user ||= Actor.find_by(id: session[:actor_id])
        elsif session[:director_id]
            @current_user ||= Director.find_by(id: session[:director_id])
        elsif session[:casting_director_id]
            @current_user ||= CastingDirector.find_by(id: session[:casting_director_id])
        end
    end

    def current_user_model
        if session[:actor_id]
            Actor
        elsif session[:director_id]
            Director
        elsif session[:casting_director_id]
            CastingDirector
        end
    end


    def owner?
        current_user == (@actor || @director || @casting_director || @user)
    end
    
    def allowed?
        unless owner?
            flash[:error] = "You do not have access to that page."
            redirect_back(fallback_location: root_path)
        end
    end

    def signed_in?
        if session[:actor_id]
            redirect_to actor_profile_path(session[:actor_id])
        elsif session[:director_id]
            redirect_to director_profile_path(session[:director_id])
        elsif session[:casting_director_id]
            redirect_to casting_director_profile_path(session[:casting_director_id])
        end
    end
end
