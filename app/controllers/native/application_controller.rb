class Native::ApplicationController < ActionController::Base

    def set_app_owner
        current_user if current_user
    end

end
