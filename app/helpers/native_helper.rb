module NativeHelper

    def current_app
        Native::App.find(cookies[:nativeAppId]) if cookies[:nativeAppId]
    end

    def current_platform
        current_app&.platform || 'web'
    end

    def native_assets
        stylesheet = stylesheet_link_tag "native/#{current_platform}/stylesheets/application", media: 'all', 'data-turbolinks-track': 'reload'
        javascript = javascript_include_tag "native/#{current_platform}/javascripts/application", 'data-turbolinks-track': 'reload'
        stylesheet.concat javascript
    end

end
