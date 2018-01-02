module NativeHelper

    def current_app
        Native::App.find(cookies[:nativeAppId]) if cookies[:nativeAppId]
    end

    def current_platform
        current_app&.platform || 'web'
    end

    def native_assets
        stylesheet = stylesheet_link_tag "native/#{current_platform}", media: 'all', 'data-turbolinks-track': 'reload'
        javascript = javascript_include_tag "native/#{current_platform}", 'data-turbolinks-track': 'reload'
        stylesheet.concat javascript
    end

    def set_app_owner
        current_user if current_user
    end

end
