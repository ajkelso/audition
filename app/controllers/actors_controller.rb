class ActorsController < ApplicationController
    before_action :find_actor, only: [:show, :edit, :update]

    def index
        @actors = Actor.all 
    end
    
    def show
    end

    def new
        @actor = Actor.new
    end

    def create
        @actor = Actor.new(actor_params)
        if @actor.save
            session[:actor_id] = actor.id 
            redirect_to actor_path(actor)
        else
            flash[:errors] = @actor.errors.full_messages
            redirect_to new_actor_path
        end
    end

    def edit
    
    end

    def update
    
    end





    private

    def find_actor
        @actor = Actor.find_by(params[:id])
    end

    def actor_params
        params.require(:actor).permit(:name, :email, :phone_number, :password)
    end
end
