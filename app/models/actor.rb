class Actor < ApplicationRecord
    has_many :auditions, dependent: :destroy
    has_many :projects, through: :auditions
    has_many :directors, through: :projects
    has_many :casting_directors, through: :projects
    has_secure_password
end
