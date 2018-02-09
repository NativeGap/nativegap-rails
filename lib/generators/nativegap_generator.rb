require 'rails/generators'
require 'rails/generators/migration'

class NativegapGenerator < Rails::Generators::Base

    include Rails::Generators::Migration

    source_root File.join File.dirname(__FILE__), 'templates'
    desc 'Install NativeGap'

    def self.next_migration_number dirname
        if ActiveRecord::Base.timestamped_migrations
            Time.now.utc.strftime '%Y%m%d%H%M%S'
        else
            "%.3d" % ( current_migration_number(dirname) + 1 )
        end
    end

    def create_initializer
        template 'initializer.rb', 'config/initializers/nativegap.rb'
    end

    def create_app_model
        migration_template 'apps_migration.rb.erb', 'db/migrate/nativegap_migration.rb', migration_version: migration_version
        template 'app_model.rb', 'app/models/native_gap/app.rb'
    end

    def create_assets
        create_assets_for 'android'
        create_assets_for 'ios'
        create_assets_for 'windows'
        create_assets_for 'chrome'
        create_assets_for 'web'
    end

    def show_readme
        readme 'README.md'
    end

    private

    def migration_version
        if Rails.version >= '5.0.0'
            "[#{Rails::VERSION::MAJOR}.#{Rails::VERSION::MINOR}]"
        end
    end

    def create_assets_for platform
        @platform = platform
        template 'application.css.erb', "app/assets/stylesheets/nativegap/#{platform}.css"
        template 'keep-file', "app/assets/stylesheets/nativegap/#{platform}/.keep"
        template 'application.js.erb', "app/assets/javascripts/nativegap/#{platform}.js"
        template 'keep-file', "app/assets/javascripts/nativegap/#{platform}/.keep"
    end

end
