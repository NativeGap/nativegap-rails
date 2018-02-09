require 'rails/railtie'

module NativeGap
    class Railtie < Rails::Railtie

        initializer 'nativegap.mozaic' do
            Mozaic.configure do |config|
                config.define_component 'nativegap/assets'
            end
        end

        initializer 'nativegap.active_record' do
            ActiveSupport.on_load :active_record do
                include NativeGapModel
            end
        end

        initializer 'nativegap.action_controller' do
            ActiveSupport.on_load :action_controller do
                include NativeGapHelper
                include NativeGapController
            end
        end

        initializer 'nativegap.sprockets-rails' do
            Rails.application.config.assets.precompile += %w( nativegap/android.js nativegap/ios.js nativegap/windows.js nativegap/chrome.js nativegap/web.js nativegap/android.css nativegap/ios.css nativegap/windows.css nativegap/chrome.css nativegap/web.css )
        end

    end
end
