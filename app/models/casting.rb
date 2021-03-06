class Casting < ApplicationRecord
    has_many :projects
    has_many :auditions, through: :projects
    has_many :actors, through: :auditions
    has_many :directors, through: :projects
    has_many :notes, as: :notable
    has_secure_password

    validates_presence_of :name, :email
    validates_uniqueness_of :name, :email
    validates :password, confirmation: { case_sensitive: true }
end
