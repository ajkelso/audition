class CastingDirector < ApplicationRecord
    has_many :projects
    has_many :auditions, through: :projects
    has_many :actors, through: :auditions
    has_many :directors, through: :projects
    has_secure_password
end
