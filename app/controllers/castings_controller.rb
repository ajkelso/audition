class CastingsController < ApplicationController
    before_action :find_casting, only: [:show, :edit, :update, :profile]
    before_action :allowed?, only: [:edit, :update, :profile]

    def index
        @castings = Casting.order(:name)
    end
    
    def show
        unless @casting
            flash[:error] = "Casting Director not found."
            redirect_to castings_path 
        end
        @projects = @casting.projects unless @casting.projects.empty?
    end
    
    def profile 
        allowed?
    end

    def edit

    end

    def update
        if @casting.update(casting_params)
            redirect_to casting_path(@casting)
        else
            flash.now[:errors] = @casting.errors.full_messages
            render :edit
        end
    end

    private

    def find_casting
        @casting = Casting.find_by(id: params[:id])
    end

    def casting_params
        params.require(:casting).permit(:name, :email, :phone_number, :password, :password_confirmation)
    end
end
