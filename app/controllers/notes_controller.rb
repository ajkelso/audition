class NotesController < ApplicationController
    def new
        
    end

    def create
        @note = Note.create(note_params, notable: current_user)
    end


    private

    def note_params
        params.require(:note).permit(:content, :audition_id)
    end
end
