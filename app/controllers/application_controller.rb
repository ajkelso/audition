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
        elsif session[:casting_id]
            @current_user ||= Casting.find_by(id: session[:casting_id])
        end
    end

    def current_user_model
        if session[:actor_id]
            Actor
        elsif session[:director_id]
            Director
        elsif session[:casting_id]
            Casting
        end
    end


    def owner?
        current_user == (@actor || @director || @casting || @user)
    end
    
    def allowed?
        unless owner?
            flash[:error] = "You do not have access to that page."
            redirect_to "/#{current_user_model.to_s.downcase}s/#{current_user.id}/profile"
        end
    end

    def signed_in?
        if current_user
            redirect_to "/#{current_user_model.to_s.downcase}s/#{current_user.id}/profile"
        end
    end
end
