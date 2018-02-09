require 'rails/railtie'

module Native
    class Railtie < Rails::Railtie

        initializer 'native.active_record' do
            ActiveSupport.on_load :active_record do
                include Native::Owner
            end
        end

        initializer 'native.action_controller' do
            ActiveSupport.on_load :action_controller do
                include NativeHelper
            end
        end

        initializer 'native.sprockets-rails' do
            Rails.application.config.assets.precompile += %w( native/android.js native/ios.js native/windows.js native/chrome.js native/web.js native/android.css native/ios.css native/windows.css native/chrome.css native/web.css )
        end

    end
end
