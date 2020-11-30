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
    

end
