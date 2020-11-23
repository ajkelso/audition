class Director < ApplicationRecord
    has_many :projects
    has_many :auditions, through: :projects
    has_many :casting_directors, through: :projects
    has_many :actors, through: :auditions
    has_secure_password
end
