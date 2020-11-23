class Actor < ApplicationRecord
    has_many :auditions, dependent: :destroy
    has_many :projects, through: :auditions
end
