class ActorsController < ApplicationController
    before_action :find_actor, only: [:show, :edit, :update, :profile]
    before_action :allowed?, only: [:edit, :update, :profile]

    def index
        @actors = Actor.order(:name) 
    end
    
    def show
        unless @actor
            flash[:error] = "Actor not found."
            redirect_to actors_path 
        end
    end
    
    def profile 
        
    end

    def edit
        
    end

    def update
        if @actor.update(actor_params)
            redirect_to actor_path(@actor)
        else
            flash.now[:errors] = @actor.errors.full_messages
            render :edit
        end
    end

    private

    def find_actor
        @actor = Actor.find_by(id: params[:id])
    end

    def actor_params
        params.require(:actor).permit(:name, :email, :phone_number, :password, :password_confirmation)
    end

end
