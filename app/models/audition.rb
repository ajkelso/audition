class Audition < ApplicationRecord
    belongs_to :actor 
    belongs_to :project
    has_many :notes 
    accepts_nested_attributes_for :notes 

    validates :time, uniqueness: { scope: :actor_id, message: "Actor has another audition scheduled at this time." }
    validates :time, uniqueness: { scope: :project_id, message: "Project has another audition scheduled at this time." }
end
