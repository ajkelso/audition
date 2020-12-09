class NotesController < ApplicationController
    before_action :find_note

    def create
        @note = Note.create(note_params)
        note_access?
        redirect_to audition_path(@note.audition)
    end

    def destroy
        if @note && note_owner?
            @note.delete
            redirect_to audition_path(params[:audition_id])
        else 
            flash[:error] = "You do not have access"
        end
    end
    
    def edit
        if @note && note_owner?
            @audition = Audition.find_by(id: params[:audition_id])
            render "auditions/show"
        else
            flash[:error] = "You do not have access"
            redirect_to profile
        end
    end
        
    def update
        if @note && note_owner?
            @note.update(note_params)
            redirect_to audition_path(params[:audition_id])
        else
            flash[:error] = "You do not have access"
            redirect_to profile
        end
    end
            
            
    private

    def find_note
        @note = Note.find_by(id: params[:id])
    end

    def note_params
        params.require(:note).permit(:content, :audition_id, :notable_type, :notable_id)
    end

    def note_access?
        unless audition_owner?
            flash[:error] = "You do not have access"
            redirect_to profile
        end
    end

    def audition_owner?
        (current_user == @note.audition.actor) || (current_user == @note.audition.project.director) || (current_user == @note.audition.project.casting)
    end

    def note_owner?
        current_user == @note.notable
    end

end
