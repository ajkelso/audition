module ProjectsHelper
    def project_creative?(project)
        current_user == (project.director || project.casting)
    end
end
