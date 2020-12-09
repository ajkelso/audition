class StaticController < ApplicationController
  skip_before_action :verified_user, only: [:home]
  
  def home
    if current_user
      redirect_to profile
    end
  end
  
end
