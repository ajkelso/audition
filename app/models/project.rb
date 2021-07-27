class Project < ApplicationRecord
    belongs_to :casting
    belongs_to :director
    has_many :auditions, dependent: :destroy

    validates_presence_of :title
    validates_presence_of :medium, message: "Type can't be blank"

    scope :get_seeking, -> {where('seeking = ?', true)}

    def self.get_director_projects(query)
        Project.joins(:director).where("name = ?", query)
    end
end

