class DirectorsController < ApplicationController
    skip_before_action :verified_user, only: [:new, :create]
    before_action :find_director, only: [:show, :edit, :update, :profile]
    before_action :allowed?, only: [:edit, :update]

    def index
        @directors = Director.all 
    end
    
    def show
        unless @director
            flash[:error] = "Director not found."
            redirect_to directors_path 
        end
    end
    
    def profile 
        allowed?
    end
    
    def new
        signed_in?
        @director = Director.new
    end

    def create
        @director = Director.new(director_params)
        if @director.save
            session[:director_id] = @director.id 
            redirect_to director_path(@director)
        else
            flash.now[:errors] = @director.errors.full_messages
            render :new
        end
    end

    def edit
    end

    def update
        if @director.update(director_params)
            redirect_to director_path(@director)
        else
            flash.now[:errors] = @director.errors.full_messages
            render :edit
        end
    end

    

    private

    def find_director
        @director = Director.find_by(id: params[:id])
    end

    def director_params
        params.require(:director).permit(:name, :email, :phone_number, :password, :password_confirmation)
    end

end
