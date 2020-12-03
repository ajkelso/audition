class NotesController < ApplicationController
    def new
        
    end

    def create
        byebug
        @note = Note.create(note_params)
        redirect_to audition_path(@note.audition)
    end


    private

    def note_params
        params.require(:note).permit(:content, :audition_id, :notable_type, :notable_id)
    end
end
