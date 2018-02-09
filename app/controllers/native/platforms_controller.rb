module Native
    class PlatformsController < ApplicationController

        def android
            set_app 'android'
            redirect_to send(Native.configuration.android_url)
        end

        def ios
            set_app 'ios'
            redirect_to send(Native.configuration.ios_url)
        end

        def windows
            set_app 'windows'
            redirect_to send(Native.configuration.windows_url)
        end

        def chrome
            set_app 'chrome'
            redirect_to send(Native.configuration.chrome_url)
        end

        private

        def set_app platform
            id = cookies[:nativeAppId]
            url = request.original_url[0...-( platform.length + 1 )]
            @app = Native::App.find_by(id: id, platform: platform, url: url) if id && Native::App.where(id: id, platform: platform, url: url).any?

            if @app.nil?
                @app = Native::App.new
                @app.platform = platform
                @app.url = url
            end
            @app.owner = set_app_owner
            @app.last_used = Time.now
            @app.save!

            cookies[:nativeAppId] = @app.id
            cookies[:nativePlatform] = platform
            cookies[:nativeApp] = url
        end

    end
end
