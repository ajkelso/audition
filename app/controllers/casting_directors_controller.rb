class CastingDirectorsController < ApplicationController
    skip_before_action :verified_user, only: [:new, :create]
    before_action :find_casting_director, only: [:show, :edit, :update, :profile]
    before_action :allowed?, only: [:edit, :update]

    def index
        @casting_directors = CastingDirector.all 
    end
    
    def show
        unless @casting_director
            flash[:error] = "Casting Director not found."
            redirect_to casting_directors_path 
        end
    end
    
    def profile 
        allowed?
    end
    
    def new
        signed_in?
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
        if @casting_director.update(casting_director_params)
            redirect_to casting_director_path(@casting_director)
        else
            flash.now[:errors] = @casting_director.errors.full_messages
            render :edit
        end
    end

    

    private

    def find_casting_director
        @casting_director = CastingDirector.find_by(id: params[:id])
    end

    def casting_director_params
        params.require(:casting_director).permit(:name, :email, :phone_number, :password, :password_confirmation)
    end

end
