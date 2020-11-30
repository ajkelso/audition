class DirectorsController < ApplicationController
    skip_before_action :verified_user, only: [:new, :create]
    before_action :find_director, only: [:show, :edit, :update]

    def index
        @directors = Director.all 
    end
    
    def show
        redirect_to director_path unless @director
    end

    def new
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
    
    end





    private

    def find_director
        @director = Director.find_by(id: params[:id])
    end

    def director_params
        params.require(:director).permit(:name, :email, :phone_number, :password, :password_confirmation)
    end
end

