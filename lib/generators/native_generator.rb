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
        template 'application.css', 'app/assets/native/android/stylesheets/application.css'
        template 'application.js', 'app/assets/native/android/javascripts/application.js'
        template 'application.css', 'app/assets/native/ios/stylesheets/application.css'
        template 'application.js', 'app/assets/native/ios/javascripts/application.js'
        template 'application.css', 'app/assets/native/uwp/stylesheets/application.css'
        template 'application.js', 'app/assets/native/uwp/javascripts/application.js'
        template 'application.css', 'app/assets/native/chrome/stylesheets/application.css'
        template 'application.js', 'app/assets/native/chrome/javascripts/application.js'
        template 'application.css', 'app/assets/native/osx/stylesheets/application.css'
        template 'application.js', 'app/assets/native/osx/javascripts/application.js'
        template 'application.css', 'app/assets/native/win32/stylesheets/application.css'
        template 'application.js', 'app/assets/native/win32/javascripts/application.js'
        template 'application.css', 'app/assets/native/win64/stylesheets/application.css'
        template 'application.js', 'app/assets/native/win64/javascripts/application.js'
        template 'application.css', 'app/assets/native/lin32/stylesheets/application.css'
        template 'application.js', 'app/assets/native/lin32/javascripts/application.js'
        template 'application.css', 'app/assets/native/lin64/stylesheets/application.css'
        template 'application.js', 'app/assets/native/lin64/javascripts/application.js'
        template 'application.css', 'app/assets/native/web/stylesheets/application.css'
        template 'application.js', 'app/assets/native/web/javascripts/application.js'
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

end
