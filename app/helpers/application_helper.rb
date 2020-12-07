module ApplicationHelper
    def creative?
        current_user.class == (Director || CastingDirector)
    end
end
