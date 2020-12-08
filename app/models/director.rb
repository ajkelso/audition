class Director < ApplicationRecord
    has_many :projects
    has_many :auditions, through: :projects
    has_many :casting, through: :projects
    has_many :actors, through: :auditions
    has_many :notes, as: :notable
    has_secure_password
    
    validates_presence_of :name, :email
    validates_uniqueness_of :name, :email
    validates :password, confirmation: { case_sensitive: true }
end
