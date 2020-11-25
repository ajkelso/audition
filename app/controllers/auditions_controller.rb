class AuditionsController < ApplicationController

    def new
        if params[:actor_id] && !Actor.exists?(params[:actor_id])
            flash[:errors] = "Actor not found."
            redirect_to actors_path
        elsif params[:project_id] && !Project.exists?(params[:project_id])
            flash[:errors] = "Project not found."
            redirect_to projects_path
        else  
            @audition = Audition.new(actor_id: params[:actor_id], project_id: params[:project_id])
        end
    end

    

end
