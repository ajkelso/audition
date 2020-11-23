class Project < ApplicationRecord
    belongs_to :casting_director
    belongs_to :director
    has_many :auditions, dependent: :destroy
end
