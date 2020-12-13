module AuditionsHelper
    def actor_id_field(audition)
        if audition.id.nil? && creative?
            select_tag 'audition[actor_id]', options_from_collection_for_select(Actor.all, :id, :name), class:"form-control"
        else
            select_tag 'audition[actor_id]', options_for_select([["#{@audition.actor.name}", "#{@audition.actor.id}"]]), class:"form-control"
        end
    end

    def project_id_field(audition)
        if audition.id.nil?
            select_tag 'audition[project_id]', options_from_collection_for_select(@projects, :id, :title, :selected => selected_project), class:"form-control"
        else
            select_tag 'audition[project_id]', options_for_select([["#{@audition.project.title}", "#{@audition.project.id}"]]), class:"form-control"
        end
    end  
    
    def selected_project
        if @audition.project.nil?
            @projects.first.id
        else
            @audition.project.id
        end
    end

end
