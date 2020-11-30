class AuditionsController < ApplicationController
    before_action :find_audition, only: [:show, :edit, :update, :destroy]
    def new
        if params[:actor_id] && !Actor.exists?(params[:actor_id])
                flash[:error] = "Actor not found."
            redirect_to actors_path
        elsif params[:project_id] && !Project.exists?(params[:project_id])
            flash[:error] = "Project not found."
            redirect_to projects_path
        else  
            @audition = Audition.new(actor_id: params[:actor_id], project_id: params[:project_id])
        end
    end

    def create
        @audition = Audition.new(audition_params)
        if @audition.save
            redirect_to audition_path(@audition)
        else
            flash.now[:errors] = @audition.errors.full_messages
            render :new
        end
    end


    private

    def audition_params
        params.require(:audition).permit(:actor_id, :project_id, :location, :time)
    end

    def find_audition
        @audition = Audition.find_by(id: params[:id])
    end
    

end
