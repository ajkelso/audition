class SessionsController < ApplicationController
    
    skip_before_action :verified_user, only: [:new, :create, :google_login]
    
    def new
        signed_in?
    end

    def create
        @user = params[:user_type].constantize.find_by(email: params[:email])
        if @user && @user.authenticate(params[:password])
            session["#{params[:user_type].downcase}_id".to_sym] = @user.id
            redirect_to "/#{params[:user_type].downcase}s/#{@user.id}/profile"
        else
            flash[:error] = "Invalid email address or password"
            redirect_to new_session_path
        end
    end

    def google_login
        name = request.env['omniauth.auth']['info']['name']
        email = request.env['omniauth.auth']['info']['email']
        @actor = Actor.find_or_create_by(email: email) do |actor|
            actor.name = name
            actor.password = SecureRandom.hex
        end
        session[:actor_id] = @actor.id
        redirect_to actor_profile_path(@actor)
    end

    def destroy
        [:actor_id, :director_id, :castingdirector_id].each { |id| session.delete(id) } 
        redirect_to new_session_path
    end

    
end
