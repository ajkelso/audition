class ProjectsController < ApplicationController
    
    def index
        if params[:director_id]
            @director = Director.find_by(id: params[:director_id])
            if owner?
                @projects = @director.projects
                @project = Project.new(director_id: params[:director_id])
            else
                flash[:error] = "You do not have access"
                redirect_to root_path
            end
        elsif params[:casting_director_id]
            @casting_director = CastingDirector.find_by(id: params[:casting_director_id])
            if owner? 
                @projects = @casting_director.projects 
            else
                flash[:error] = "You do not have access"
                redirect_to root_path
            end
        else
            @projects = Project.get_seeking    
        end
    end

    def create
        @project = Project.new(project_params)
        @project.director_id = current_user.id 
        @project.save
        redirect_to director_projects_path(current_user)
    end

    private

    def project_params
        params.require(:project).permit(:title, :medium, :director_id, :casting_director_id)
    end

end
