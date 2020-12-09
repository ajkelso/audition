class SessionsController < ApplicationController
    
    skip_before_action :verified_user, only: [:new, :create, :google_login, :signup, :google_signup, :create_user]
    
    def new
        signed_in?
    end

    def create
        @user = params[:user_type].constantize.find_by(email: params[:email])
        if @user && @user.authenticate(params[:password])
            session["#{params[:user_type].downcase}_id".to_sym] = @user.id
            redirect_to profile
        else
            flash[:error] = "Invalid email address or password"
            redirect_to new_session_path
        end
    end

    def signup
        signed_in?
    end

    def create_user
        signed_in?
        @user = params[:user_type].constantize.new(session_params)
        if @user.save
            session["#{params[:user_type].downcase}_id".to_sym] = @user.id
            redirect_to profile
        else    
            flash.now[:errors] = @user.errors.full_messages
            render :signup
        end     
    end
    
    def google_signup
        session[:user_type] = params[:user_type]
        redirect_to '/auth/google_oauth2'
    end

    def google_login
        name = request.env['omniauth.auth']['info']['name']
        email = request.env['omniauth.auth']['info']['email']
        @user = session[:user_type].constantize.find_or_create_by(email: email) do |user|
            user.name = name
            user.password = SecureRandom.hex
        end
        session["#{session[:user_type].downcase}_id".to_sym] = @user.id
        profile_redirect
    end

    def destroy
        [:actor_id, :director_id, :casting_id].each { |id| session.delete(id) } 
        redirect_to new_session_path
    end

    private

    def session_params
        params.permit(:name, :email, :phone_number, :password, :password_confirmation)
    end

    def profile_redirect
        if current_user_model == Actor 
            redirect_to actor_profile_path(@user)
        elsif current_user_model == Director 
            redirect_to director_profile_path(@user)
        elsif current_user_model == Casting 
            redirect_to casting_profile_path(@user)
        end
    end
end
