module ProjectsHelper
    def project_creative?
        current_user == (@project.director || @project.casting_director)
    end
end
