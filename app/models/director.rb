class Director < ApplicationRecord
    has_many :projects
    has_many :auditions, through: :projects
    has_many :casting_directors, through: :projects
end
