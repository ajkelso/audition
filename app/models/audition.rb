class Audition < ApplicationRecord
    belongs_to :actor 
    belongs_to :project  

    validates :time, uniqueness: { scope: :actor_id, message: "Actor has another audition scheduled at this time." }
    validates :time, uniqueness: { scope: :project_id, message: "Project has another audition scheduled at this time." }
end
