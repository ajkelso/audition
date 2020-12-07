class Project < ApplicationRecord
    belongs_to :casting_director
    belongs_to :director
    has_many :auditions, dependent: :destroy

    validates_presence_of :title
    validates_presence_of :medium, message: "Type can't be blank"

    scope :get_seeking, -> {where('seeking = ?', true)}
end
