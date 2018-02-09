# Native

[![Gem Version](https://badge.fury.io/rb/native.svg)](https://badge.fury.io/rb/native) <img src="https://travis-ci.org/NativeGap/native-rails.svg?branch=master" />

Creating cross-platform apps with Rails has never been this simple, pleasing & powerful. With very little code you can bring any Rails web application to every desktop or mobile platform you can think of.

**Features:**

* Convert your Rails app to a native app
* Add custom assets for any of your platforms
* Customize your code for every platform by utilizing Native's view helpers
* Remember what apps/platforms your users are on
* Add native notifications

**Platforms:**

* Android
* iOS
* Universal Windows Platform (Windows 10)
* Chrome

---

Native is being powered by **[NativeGap](https://nativegap.com)**.

---

## Table of Contents

* [Installation](#installation)
* [Usage](#usage)
    * [NativeGap](#nativegap)
    * [Assets](#assets)
    * [App methods](#app-methods)
        * [Associate objects](#associate-objects)
    * [View methods](#view-methods)
    * [Notifications](#notifications)
    * [Content scaling (Android)](#content-scaling-android)
* [Configuration](#configuration)
* [To Do](#to-do)
* [Contributing](#contributing)
    * [Contributors](#contributors)
    * [Semantic versioning](#semantic-versioning)
* [License](#license)

---

## Installation

Native works with Rails 5 onwards. You can add it to your `Gemfile` with:

```ruby
gem 'native'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install native

If you always want to be up to date fetch the latest from GitHub in your `Gemfile`:

```ruby
gem 'native', github: 'NativeGap/native'
```

Now run the generator:

    $ rails g native

To wrap things up, migrate the changes into your database:

    $ rails db:migrate

Let's move on to your devise class. For instance `User` located in `app/models/user.rb`. Associate belonging `App` objects:

```ruby
uses_native_apps
```

Lastly, got to your routes file (`config/routes.rb`) and mount the `Native::Engine` class:

```ruby
mount Native::Engine, at: '/native'
```

Make also sure to add the following to your app config (`config/application.rb`):

```ruby
config.action_dispatch.default_headers = {
   'X-Frame-Options' => 'ALLOWALL'
}
```

## Usage

### NativeGap

While this gem assists you in creating a true cross-platform app, [NativeGap](https://nativegap.com) is still needed to create the actual native code. That's not too big of a deal though, NativeApp can be used entirely for free ([learn more](https://nativegap.com/pricing)) and it has an extensive [documentation](https://nativegap.com/guide).

Getting started with NativeGap:

1. Create a new NativeGap app
2. Wait until platforms processed
3. For each platform you want to support: click `Update` and enter the start path. The start path consists of your `Native::Engine` mount path and the platform. It could look like this: `native/android`

That's it!

**Note:** Native also supports the coexistence of multiple NativeGap apps with only one Rails app as a source.

### Assets

With Native it is fairly simple to add platform specific stylesheets and scripts. In your assets directory you have a new folder for your `javascripts` and `stylesheets` (`app/assets/.../native`). In these two folders you are able to add custom assets for specific platforms including `web` specific assets.

You simple have to include ...

```ruby
= native_assets
```

... in the `head` tag of your layout after your other asset include tags.

### App methods

Native introduces an `App` ActiveRecord model. Every object of your devise class can have multiple apps.

```ruby
a = App.first

# Returns associated object. Can return `nil`.
a.owner

# Returns lowercase string of platform.
d.platform

# Returns url of mounted `NativeGap::Engine` class. This can be used to differentiate between apps, if you have multiple NativeGap apps with one Rails app as source.
d.url

# Some timestamps
d.last_used
d.created_at
d.updated_at


# Returns activerecord array of apps from a specific platform
d.android
# ...
d.lin64

# Group apps by `platform`
d.platforms

# Group apps by `url`
d.apps
```

#### Associate objects

If you are using Devise and your model is named `User`, the object returned by `current_user` will automatically be associated with the current app. If your Devise model is not named `User` or you are using a different user-management solution that does not implement a `current_user` method, you are able to override this default behavior.

Let's say our Devise model is named `Admin`. Just add a method to your `ApplicationController`:

```ruby
def set_app_owner
    current_admin if current_admin
end
```

**Note:** Essentially `set_app_owner` has to return a class object *or* `nil`.

Now you are able to access the applications used by an user:

```ruby
User.first.native_apps
```

### View & controller methods

**`current_app`** Returns `App` object related to current session. Returns `nil` when the Rails is being used normally.

**`current_platform`** Returns lowercase string of current platform. Returns `'web'` when the Rails is being used normally.

**`native_assets`** Returns platform specific `<link rel="stylesheet">` and `<script>` tags to include platform specific assets.

If you want to use them in your controllers, just add `include NativeHelper` at the top.

### Notifications

You can enable native notifications on most platforms. To handle notifications Native integrates with the [notifications-rails](https://github.com/jonhue/notifications-rails) gem. Implement the [notification-pusher-onesignal](https://github.com/jonhue/notifications-rails/tree/master/notification-pusher/notification-pusher-onesignal) component to push notifications to your native applications.

### Content scaling (Android)

NativeGap apps on Android often look scaled down. To fix this in your app add the following to `app/assets/javascripts/native/android.js`:

```js
//= require nativeScale

document.addEventListener( 'turbolinks:load', function() {
    nativeScale();
});
```

This will adjust the `font-size` of `:root`. The pixel value can be [configured](#configuration).

---

## Configuration

You can configure Native by passing a block to `configure`. This can be done in `config/initializers/native.rb`:

```ruby
Native.configure do |config|
    config.android = true
end
```

**`#{platform}`** Set to `false` to disable the platform. Takes a boolean. Defaults to `true`.

**`#{platform}_url`** Specify the start url of your app on a given platform by passing a stringified route helper. Takes a string. Defaults to `'root_url'`.

**`scale_size`** Defining `:root` `font-size` on Android apps, [learn more](#content-scaling-android). Takes a string. Defaults to `'18px'`.

---

## To Do

[Here](https://github.com/NativeGap/native-rails/projects/1) is the full list of current projects.

To propose your ideas, initiate the discussion by adding a [new issue](https://github.com/NativeGap/native-rails/issues/new).

---

## Contributing

We hope that you will consider contributing to Native. Please read this short overview for some information about how to get started:

[Learn more about contributing to this repository](https://github.com/NativeGap/native-rails/blob/master/CONTRIBUTING.md), [Code of Conduct](https://github.com/NativeGap/native-rails/blob/master/CODE_OF_CONDUCT.md)

### Contributors

Give the people some :heart: who are working on this project. See them all at:

https://github.com/NativeGap/native-rails/graphs/contributors

### Semantic Versioning

Native follows Semantic Versioning 2.0 as defined at http://semver.org.

## License

MIT License

Copyright (c) 2017 Jonas Hübotter

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
