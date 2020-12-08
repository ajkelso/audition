class ProjectsController < ApplicationController
    before_action :find_project, only: [:show, :edit, :update, :destroy]
    def index
        get_projects
    end

    def create
        @project = Project.new(project_params)
        @project.save
        redirect_to current_user_projects_path
    end

    def show
    
    end

    def edit
    end

    def update
        if @project.update(project_params)
            redirect_to @project
        else
            flash[:errors] = @project.errors.full_messages
            redirect_to edit_project_path(@project)
        end
    end

    def destroy
        @project.delete 
        redirect_to current_user_projects_path
    end
    
    private

    def find_project
        @project = Project.find_by(id: params[:id])
    end
    
    def project_params
        params.require(:project).permit(:title, :medium, :director_id, :casting_id, :seeking)
    end

    def get_projects
        if params[:director_id]
            @director = Director.find_by(id: params[:director_id])
            if owner?
                @projects = @director.projects
                @project = Project.new(director_id: params[:director_id])
            else
                flash[:error] = "You do not have access"
                redirect_to root_path
            end
        elsif params[:casting_id]
            @casting = Casting.find_by(id: params[:casting_id])
            if owner? 
                @projects = @casting.projects 
                @project = Project.new(casting_id: params[:casting_id])
            else
                flash[:error] = "You do not have access"
                redirect_to root_path
            end
        else
            @projects = Project.get_seeking    
        end
    end

    def current_user_projects_path
        "/#{current_user_model.to_s.downcase}s/#{current_user.id}/projects" 
    end
        

end
