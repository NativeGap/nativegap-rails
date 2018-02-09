module NativeHelper

    def current_app
        Native::App.find(cookies[:nativeAppId]) if cookies[:nativeAppId]
    end

    def current_platform
        current_app&.platform || 'web'
    end

    def set_app_user
        current_user if current_user
    end

end
