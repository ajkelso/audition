module AuditionsHelper
    def actor_id_field(audition)
        if audition.actor.nil?
            select_tag 'audition[actor_id]', options_from_collection_for_select(Actor.all, :id, :name)
        else
            hidden_field_tag "audition[actor_id]", audition.actor_id
        end
    end

    def project_id_field(audition)
        if audition.project.nil?
            label_tag "Project"
            select_tag 'audition[project_id]', options_from_collection_for_select(Project.all, :id, :title)
        else
            hidden_field_tag "audition[project_id]", audition.project_id
        end
    end
        
end
