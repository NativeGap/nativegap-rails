module NativeHelper

    def current_app
        NativeGap::App.find(cookies[:nativegapAppId]) if cookies[:nativegapAppId]
    end

    def current_platform
        current_app&.platform || 'web'
    end

    def set_nativegap_user
        current_user if current_user
    end

end
