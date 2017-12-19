module NativeHelper

    def current_app
        Native::App.find(id) if cookies[:nativeAppId]
    end

    def current_platform
        current_app&.platform
    end

    def native_assets
        stylesheet = stylesheet_link_tag "native/#{current_platform}/application", media: 'all', 'data-turbolinks-track': 'reload'
        javascript = javascript_include_tag "native/#{current_platform}/application", 'data-turbolinks-track': 'reload'
        stylesheet.concat javascript
    end

end
