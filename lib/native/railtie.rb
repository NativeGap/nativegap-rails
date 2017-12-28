require 'rails/railtie'

module Native
    class Railtie < Rails::Railtie

        initializer 'native.initialize' do
            Rails.application.config.assets.precompile += %w( native/android.js native/ios.js native/uwp.js native/chrome.js native/osx.js native/win32.js native/win64.js native/lin32.js native/lin64.js native/web.js native/android.css native/ios.css native/uwp.css native/chrome.css native/osx.css native/win32.css native/win64.css native/lin32.css native/lin64.css native/web.css )
        end

    end
end
