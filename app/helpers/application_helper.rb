module ApplicationHelper
    def creative?
        (current_user.class == Casting) || (current_user.class == Director)
    end

    def my_auditions_link
        if current_user_model == Actor 
            link_to "My Auditions", actor_auditions_path(current_user.id)
        elsif current_user_model == Director
            link_to "My Auditions", director_auditions_path(current_user.id)
        elsif current_user_model == Casting 
            link_to "My Auditions", casting_auditions_path(current_user.id)
        end
    end

end
