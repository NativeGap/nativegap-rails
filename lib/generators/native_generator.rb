require 'rails/generators'
require 'rails/generators/migration'

class NativeGenerator < Rails::Generators::Base

    include Rails::Generators::Migration

    source_root File.join File.dirname(__FILE__), 'templates'
    desc 'Install Native'

    def self.next_migration_number dirname
        if ActiveRecord::Base.timestamped_migrations
            Time.now.utc.strftime '%Y%m%d%H%M%S'
        else
            "%.3d" % ( current_migration_number(dirname) + 1 )
        end
    end

    def create_initializer
        template 'initializer.rb', 'config/initializers/native.rb'
    end

    def create_app_model
        migration_template 'apps_migration.rb.erb', 'db/migrate/native_migration.rb', migration_version: migration_version
        template 'app_model.rb', 'app/models/native/app.rb'
    end

    def create_assets
        create_assets_for 'android'
        create_assets_for 'ios'
        create_assets_for 'uwp'
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
        template 'application.css.erb', "app/assets/stylesheets/native/#{platform}.css"
        template '.keep', "app/assets/stylesheets/native/#{platform}/.keep"
        template 'application.js.erb', "app/assets/javascripts/native/#{platform}.js"
        template '.keep', "app/assets/javascripts/native/#{platform}/.keep"
    end

end
