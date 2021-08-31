class DirectorsController < ApplicationController
    before_action :find_director, only: [:show, :edit, :update, :profile]
    before_action :allowed?, only: [:edit, :update, :profile]

    def index
        @directors = Director.order(:name) 
    end
    
    def show
        unless @director
            flash[:error] = "Director not found."
            redirect_to directors_path 
        end
        @projects = @director.projects unless @director.projects.empty?
    end
    
    def profile 
    
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
