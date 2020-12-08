class StaticController < ApplicationController
  skip_before_action :verified_user, only: [:home]
  
  def home
    if session[:actor_id]
      redirect_to actor_profile_path(session[:actor_id])
    elsif session[:director_id]
      redirect_to director_profile_path(session[:director_id])
    elsif session[:casting_id]
      redirect_to casting_profile_path(session[:casting_id])
    end
  end
end
