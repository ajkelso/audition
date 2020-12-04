class AuditionsController < ApplicationController
    before_action :find_audition, only: [:show, :edit, :update, :destroy]
    
    def index
        if params[:actor_id]
            @actor = Actor.find_by(id: params[:actor_id])
            if owner?
                @auditions = @actor.auditions
            else
                flash[:error] = "You do not have access"
                redirect_to actors_path
            end
        elsif params[:project_id]
            @project = Project.find_by(id: params[:project_id])
            if @project && current_user == @project.director || @project.casting_director
                @auditions = @project.auditions 
            else
                flash[:error] = "You do not have access"
                redirect_to projects_path
            end
        end
    end
    
    def new
        verify_actor_or_project  
        @audition = Audition.new(actor_id: params[:actor_id], project_id: params[:project_id])
    end

    def show
        
        unless actor_or_project_owner?
            flash[:error] = "You do not have access to view that auditon."
            redirect_to root_path
        end
        @note = @audition.notes.build
    end

    def create
        if can_create?
            @audition = Audition.new(audition_params)
            if @audition.save
                redirect_to audition_path(@audition)
            else
                flash.now[:errors] = @audition.errors.full_messages
                render :new
            end
        else
            flash[:error] = "You do not have access to create or modify that audition."
            redirect_to root_path
        end
    end

    def edit
        unless actor_or_project_owner?
            flash[:error] = "You do not have access to create or modify that audition."
            redirect_to root_path
        end
    end

    def update

        if @audition && actor_or_project_owner?
            @audition.update(audition_params)
            redirect_to audition_path(@audition)
        else
            flash[:error] = "You do not have access to create or modify that audition."
            redirect_to root_path
        end
    end

    def destroy
        @audition.delete
        redirect_to actor_auditions_path(@audition.actor)
    end

    private

    def audition_params
        params.require(:audition).permit(:actor_id, :project_id, :location, :time)
    end

    def find_audition
        @audition = Audition.find_by(id: params[:id])
    end

    def verify_actor_or_project
        if params[:actor_id] && params[:actor_id].to_i != session[:actor_id]
            flash[:error] = "You cannot create or modify an audition for another actor."
            redirect_to actors_path
        elsif params[:project_id]
            project = Project.find_by(params[:project_id])
            if project && current_user != project.director || project.casting_director 
                flash[:error] = "Project not found."
                redirect_to projects_path
            end
        end
    end

    def actor_or_project_owner? 
        current_user == (@audition.actor || @audition.project.director || @audition.project.casting_director) 
    end
    
    def can_create?
        project = Project.find_by(params[:audition][:project_id])
        (params[:audition][:actor_id].to_i == session[:actor_id]) || current_user == (project.director || project.casting_director)
    end

end
