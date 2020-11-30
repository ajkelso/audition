class AuditionsController < ApplicationController
    before_action :find_audition, only: [:show, :edit, :update, :destroy]
    
    def index
        if params[:actor_id]
            @actor = Actor.find_by(id: params[:actor_id])
            if @actor
                @auditions = @actor.auditions
            else
                flash[:error] = "Actor not found."
                redirect_to actors_path
            end
        elsif params[:project_id]
            @project = Project.find_by(id: params[:project_id])
            if @project 
                @auditions = @project.auditions 
            else
                flash[:error] = "Project not found."
                redirect_to projects_path
            end
        end
    end
    
    def new
        verify_actor_or_project  
        @audition = Audition.new(actor_id: params[:actor_id], project_id: params[:project_id])
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

    def verify_actor_or_project
        if params[:actor_id] && !Actor.exists?(params[:actor_id])
            flash[:error] = "Actor not found."
            redirect_to actors_path
        elsif params[:project_id] && !Project.exists?(params[:project_id])
            flash[:error] = "Project not found."
            redirect_to projects_path
        end
    end
    

end
