class ActorsController < ApplicationController
    skip_before_action :verified_user, only: [:new, :create]
    before_action :find_actor, only: [:show, :edit, :update]
    before_action :allowed?, only: [:edit, :update]

    def index
        @actors = Actor.all 
    end
    
    def show
        redirect_to actors_path unless @actor
    end

    def new
        @actor = Actor.new
    end

    def create
        @actor = Actor.new(actor_params)
        if @actor.save
            session[:actor_id] = @actor.id 
            redirect_to actor_path(@actor)
        else
            flash.now[:errors] = @actor.errors.full_messages
            render :new
        end
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

    def owner?
        session[:actor_id] == @actor.id
    end

    def allowed?
        unless owner?
            flash[:error] = "You do not have access."
            redirect_to actors_path 
        end
    end
end
