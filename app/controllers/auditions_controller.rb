class AuditionsController < ApplicationController
    before_action :find_audition, only: [:show, :edit, :update, :destroy]
    
    def index
        get_auditions_for_user
    end
    
    def new
        verify_actor_or_project  
        @audition = Audition.new(actor_id: params[:actor_id], project_id: params[:project_id])
    end

    def show
        audition_access?
        get_audition_notes
        @note = @audition.notes.build
    end

    def create
        @audition = Audition.new(audition_params)
        audition_access?

        if @audition.save
            redirect_to audition_path(@audition)
        else
            flash.now[:errors] = @audition.errors.full_messages
            render :new
        end
    end

    def edit
        audition_access?
    end

    def update
        if @audition && audition_owner?
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

    def get_auditions_for_user
        if params[:actor_id]
            @user = Actor.find_by(id: params[:actor_id])
            if allowed?
                @auditions = @user.auditions
            end
        elsif params[:director_id]
            @user = Director.find_by(id: params[:director_id])
            if allowed?
                @auditions = @user.auditions
            end
        elsif params[:casting_id]
            @user = Casting.find_by(id: params[:casting_id])
            if allowed?
                @auditions = @user.auditions
            end
        elsif params[:project_id]
            @project = Project.find_by(id: params[:project_id])
            if @project && (current_user == @project.director) || (current_user == @project.casting)
                @auditions = @project.auditions 
            else
                flash[:error] = "You do not have access"
                redirect_to projects_path
            end
        end
    end
    
    def verify_actor_or_project
        if params[:actor_id] && params[:actor_id].to_i != session[:actor_id]
            flash[:error] = "You cannot create or modify an audition for another actor."
            redirect_to "/#{current_user_model.to_s.downcase}s/#{current_user.id}/profile"
        elsif params[:project_id]
            project = Project.find_by(params[:project_id])
            if project && (current_user != project.director) || (current_user != project.casting) 
                flash[:error] = "You cannot create or modify auditions for that project."
                redirect_to projects_path
            end
        end
    end

    def audition_access?
        unless audition_owner?
            flash[:error] = "You do not have access"
            redirect_to "/#{current_user_model.to_s.downcase}s/#{current_user.id}/profile"
        end
    end

    def audition_owner?
        (current_user == @audition.actor) || (current_user == @audition.project.director) || (current_user == @audition.project.casting)
    end
    
    def get_audition_notes
        if @audition.notes
            @notes = @audition.notes.select {|note| note.notable_type == current_user_model.to_s }
        end
    end
end
