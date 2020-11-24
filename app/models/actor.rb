class Actor < ApplicationRecord
    has_many :auditions, dependent: :destroy
    has_many :projects, through: :auditions
    has_many :directors, through: :projects
    has_many :casting_directors, through: :projects
    has_secure_password

    validates_presence_of :name, :email
    validates_uniqueness_of :name, :email
    validates :password, confirmation: { case_sensitive: true }
end
