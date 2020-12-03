class Note < ApplicationRecord
    belongs_to :audition
    belongs_to :notable, polymorphic: true
end
