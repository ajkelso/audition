class ProjectsController < ApplicationController
    
    def index
        @projects = Project.get_seeking    
    end

end
