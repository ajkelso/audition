class NotesController < ApplicationController
    before_action :find_note

    def create
        @note = Note.create(note_params)
        redirect_to audition_path(@note.audition)
    end

    def destroy
        @note.delete
        redirect_to audition_path(params[:audition_id])
    end

    def edit
        @audition = Audition.find_by(id: params[:audition_id])
        render "auditions/show"
    end

    def update
        @note.update(note_params)
        redirect_to audition_path(params[:audition_id])
    end


    private

    def find_note
        @note = Note.find_by(id: params[:id])
    end

    def note_params
        params.require(:note).permit(:content, :audition_id, :notable_type, :notable_id)
    end
end
