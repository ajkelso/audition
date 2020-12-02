module AuditionsHelper
    def actor_id_field(audition)
        concat label_tag "Actor: "
        if audition.actor.nil?
            select_tag 'audition[actor_id]', options_from_collection_for_select(Actor.all, :id, :name)
        else
            concat audition.actor.name
            hidden_field_tag "audition[actor_id]", audition.actor_id
        end
    end

    def project_id_field(audition)
        concat label_tag "Project: " 
        if audition.project.nil?
            select_tag 'audition[project_id]', options_from_collection_for_select(Project.all, :id, :title)
        else
            concat audition.project.title
            hidden_field_tag "audition[project_id]", audition.project_id
        end
    end
        
end
