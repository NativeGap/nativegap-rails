**Thank you for installing Native!**


There are two more steps to take:

1) Run `rails g native` and `rails db:migrate`
2) Mount engine in `config/routes.rb`:

    mount Native::Engine, at: '/native'


Learn more at https://github.com/NativeGap/native-rails
