class CastingDirector < ApplicationRecord
    has_many :projects
    has_many :auditions, through: :projects
end
