class Project < ApplicationRecord
    has_many :auditions, dependent: :destroy
    belongs_to :casting_director
    belongs_to :director
end
