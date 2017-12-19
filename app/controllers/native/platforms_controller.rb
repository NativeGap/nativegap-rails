require_dependency 'native/application_controller'

class Native::PlatformsController < ApplicationController

    def android
        set_app 'android'
        redirect_to Native.configuration.android_redirect
    end

    def ios
        set_app 'ios'
        redirect_to Native.configuration.ios_redirect
    end

    def uwp
        set_app 'uwp'
        redirect_to Native.configuration.uwp_redirect
    end

    def chrome
        set_app 'chrome'
        redirect_to Native.configuration.chrome_redirect
    end

    def osx
        set_app 'osx'
        redirect_to Native.configuration.osx_redirect
    end

    def win32
        set_app 'win32'
        redirect_to Native.configuration.win32_redirect
    end

    def win64
        set_app 'win64'
        redirect_to Native.configuration.win64_redirect
    end

    def lin32
        set_app 'lin32'
        redirect_to Native.configuration.lin32_redirect
    end

    def lin64
        set_app 'lin64'
        redirect_to Native.configuration.lin64_redirect
    end

    private

    def set_app platform
        id = cookies[:nativeAppId]
        url = request.original_url[0...-( platform.length + 1 )]
        @app = Native::App.find_by(id: id, platform: platform, url: url) if app_id && Native::App.where(id: app_id, platform: platform, url: url).any?

        if @app.nil?
            @app = Native::App.new
            @app.platform = platform
            @app.url = url
        end
        @app.send(Native.configuration.devise_class.downcase) = send("current_#{Native.configuration.devise_class.downcase}") if send("current_#{Native.configuration.devise_class.downcase}")
        @app.last_used = Time.now
        @app.save!

        cookies[:nativeAppId] = @app.id
        cookies[:nativePlatform] = platform
        cookies[:nativeApp] = url
    end

end
