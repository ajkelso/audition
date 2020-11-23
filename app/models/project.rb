class Project < ApplicationRecord
    belongs_to :casting_director
    belongs_to :director
    has_many :auditions, dependent: :destroy

    validates_presence_of :title, :medium

    scope :get_seeking, -> {where('seeking = ?', true)}
end
