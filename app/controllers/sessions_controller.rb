class SessionsController < ApplicationController
    def new_actor
    end

    def create

        @user = params[:user_type].constantize.find_by(email: params[:email])
        if @user && @user.authenticate(params[:password])
            session[params[:user_type].to_sym] = @user.id
            redirect_to "/#{params[:user_type].downcase}s/#{@user.id}"
        else
            flash[:errors] = "Invalid email address or password"
            redirect_to new_session_path
        end
    end
    
end
