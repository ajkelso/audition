class CastingDirectorsController < ApplicationController
    skip_before_action :verified_user, only: [:new, :create]
    before_action :find_casting_director, only: [:show, :edit, :update]

    def index
        @casting_directors = CastingDirector.all 
    end
    
    def show
        redirect_to casting_director_path unless @casting_director
    end

    def new
        @casting_director = CastingDirector.new
    end

    def create
        @casting_director = CastingDirector.new(casting_director_params)
        if @casting_director.save
            session[:casting_director_id] = @casting_director.id 
            redirect_to casting_director_path(@casting_director)
        else
            flash.now[:errors] = @casting_director.errors.full_messages
            render :new
        end
    end

    def edit
    
    end

    def update
    
    end

    private

    def find_casting_director
        @casting_director = CastingDirector.find_by(id: params[:id])
    end

    def casting_director_params
        params.require(:casting_director).permit(:name, :email, :phone_number, :password, :password_confirmation)
    end
end
    
