class Director < ApplicationRecord
    has_many :projects
    has_many :auditions, through: :projects
    has_many :casting_directors, through: :projects
    has_many :actors, through: :auditions
    has_secure_password

    validates_presence_of :name, :email
    validates_uniqueness_of :name, :email
end
