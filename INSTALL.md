**Thank you for installing Native!**


There are three more steps to take:

1) Run `rails g native` and `rails db:migrate`
2) Add to `assets/manifest.js`:

    //= link_directory ../native/android/javascripts .js
    //= link_directory ../native/android/stylesheets .css
    //= link_directory ../native/ios/javascripts .js
    //= link_directory ../native/ios/stylesheets .css
    //= link_directory ../native/uwp/javascripts .js
    //= link_directory ../native/uwp/stylesheets .css
    //= link_directory ../native/chrome/javascripts .js
    //= link_directory ../native/chrome/stylesheets .css
    //= link_directory ../native/osx/javascripts .js
    //= link_directory ../native/osx/stylesheets .css
    //= link_directory ../native/win32/javascripts .js
    //= link_directory ../native/win32/stylesheets .css
    //= link_directory ../native/win64/javascripts .js
    //= link_directory ../native/win64/stylesheets .css
    //= link_directory ../native/lin32/javascripts .js
    //= link_directory ../native/lin32/stylesheets .css
    //= link_directory ../native/lin64/javascripts .js
    //= link_directory ../native/lin64/stylesheets .css
    //= link_directory ../native/web/javascripts .js
    //= link_directory ../native/web/stylesheets .css

3) Mount engine in `config/routes.rb`:

    mount Native::Engine, at: '/native'


Learn more at https://github.com/NativeGap/native-rails
