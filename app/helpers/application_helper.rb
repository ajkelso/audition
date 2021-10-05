module ApplicationHelper

    def my_auditions_link
        if current_user_model == Actor 
            link_to "My Auditions", actor_auditions_path(current_user.id), class:"nav-item nav-link"
        elsif current_user_model == Director
            link_to "My Auditions", director_auditions_path(current_user.id), class:"nav-item nav-link"
        elsif current_user_model == Casting 
            link_to "My Auditions", casting_auditions_path(current_user.id), class:"nav-item nav-link"
        end
    end

    def home_link
        if current_user_model == Actor
            link_to  "Home", "/actors/#{current_user.id}/profile", class:"nav-item nav-link"
        else
            link_to  "Home", "/#{current_user_model.to_s.downcase}s/#{current_user.id}/projects", class:"nav-item nav-link"
        end
    end

end
