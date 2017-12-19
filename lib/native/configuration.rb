module Native
    class Configuration

        attr_accessor :devise_class
        attr_accessor :android
        attr_accessor :ios
        attr_accessor :uwp
        attr_accessor :chrome
        attr_accessor :osx
        attr_accessor :win32
        attr_accessor :win64
        attr_accessor :lin32
        attr_accessor :lin64
        attr_accessor :android_redirect
        attr_accessor :ios_redirect
        attr_accessor :uwp_redirect
        attr_accessor :chrome_redirect
        attr_accessor :osx_redirect
        attr_accessor :win32_redirect
        attr_accessor :win64_redirect
        attr_accessor :lin32_redirect
        attr_accessor :lin64_redirect
        attr_accessor :scale_size

        def initialize
            @devise_class = 'User'
            @android = true
            @ios = true
            @uwp = true
            @chrome = true
            @osx = true
            @win32 = true
            @win64 = true
            @lin32 = true
            @lin64 = true
            @android_redirect = Rails.application.routes.url_helpers.root_path
            @ios_redirect = Rails.application.routes.url_helpers.root_path
            @uwp_redirect = Rails.application.routes.url_helpers.root_path
            @chrome_redirect = Rails.application.routes.url_helpers.root_path
            @osx_redirect = Rails.application.routes.url_helpers.root_path
            @win32_redirect = Rails.application.routes.url_helpers.root_path
            @win64_redirect = Rails.application.routes.url_helpers.root_path
            @lin32_redirect = Rails.application.routes.url_helpers.root_path
            @lin64_redirect = Rails.application.routes.url_helpers.root_path
            @scale_size = '18px'
        end

    end
end
