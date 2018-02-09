# NativeGap on Rails

[![Gem Version](https://badge.fury.io/rb/nativegap.svg)](https://badge.fury.io/rb/nativegap) <img src="https://travis-ci.org/NativeGap/nativegap-rails.svg?branch=master" />

Build native apps for all major platforms with NativeGap.

#### Platforms

* Android
* iOS
* Universal Windows Platform (Windows 10)
* Chrome (Extension)

#### How it works ...

1. Create and customize your apps from the [NativeGap dashboard](https://nativegap.com).
2. Add [NativeGap.js](https://github.com/NativeGap/nativegap.js) to your app in order to track currently used apps and to add some custom styling.
3. Use this gem to track app usage for your users and to add platform specific assets.

---

## Table of Contents

* [Installation](#installation)
* [Usage](#usage)
   * [Setup](#setup)
   * [Assets](#assets)
   * [User associations](#user-associations)
   * [Apps](#apps)
      * [Methods](#methods)
      * [Helpers](#helpers)
   * [Notifications](#notifications)
* [Configuration](#configuration)
* [To Do](#to-do)
* [Contributing](#contributing)
   * [Contributors](#contributors)
   * [Semantic versioning](#semantic-versioning)
* [License](#license)

---

## Installation

NativeGap on Rails works with Rails 5 onwards. You can add it to your `Gemfile` with:

```ruby
gem 'nativegap'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install nativegap

If you always want to be up to date fetch the latest from GitHub in your `Gemfile`:

```ruby
gem 'nativegap', github: 'NativeGap/nativegap-rails'
```

Now run the generator:

    $ rails g nativegap

To wrap things up, migrate the changes into your database:

    $ rails db:migrate

Make also sure to add the following to your app config (`config/application.rb`):

```ruby
config.action_dispatch.default_headers = {
   'X-Frame-Options' => 'ALLOWALL'
}
```

## Usage

### Setup

While this gem assists you in creating a true cross-platform app, [NativeGap](https://nativegap.com) is still needed to create the actual native code. That's not too big of a deal though, NativeApp can be used entirely for free ([learn more](https://nativegap.com/pricing)) and it has an extensive [documentation](https://nativegap.com/guide).

Getting started with NativeGap:

1. Create a new NativeGap app.
2. Wait until the platforms processed successfully.

That's it!

**Note:** Native also supports the coexistence of multiple NativeGap apps with only one Rails app as a source.

### Assets

With Native it is fairly simple to add platform specific stylesheets and scripts. In your assets directory you have a new folder for your `javascripts` and `stylesheets` (`app/assets/.../nativegap`). In these two folders you are able to add custom assets for specific platforms including `web` specific assets.

You simple have to add ...

```ruby
= component 'nativegap/assets'
```

... to the `head` tag of your layout after your other asset include tags.

### User associations

Define an association in models whose objects are supposed to be associated with NativeGap apps. For example `Admin` in `app/models/admin.rb`.

```ruby
class Admin < ApplicationRecord
    nativegap
end
```

Next attach an admin record by defining a `set_nativegap_user` method. Let's say our model is named `Admin` and `current_admin` is available at controller level. Just add a method to your `ApplicationController`:

```ruby
def set_nativegap_user
    current_admin if current_admin
end
```

**Note:** If a `current_user` method is available at controller level this method is not required.

You are now able to get NativeGap apps for a specific user:

```ruby
a = Admin.first

# All app records of a user
a.nativegap_apps
```

### Apps

Native introduces an `App` ActiveRecord model. Every object of an associated user class can have multiple apps.

#### Methods

```ruby
a = App.first

# Returns associated object. Can return `nil`.
a.owner

# Returns lowercase string of platform.
d.platform

# Returns the apps start url. This can be used to differentiate between apps, if you have multiple NativeGap apps with one Rails app as source.
d.url

# Some timestamps
d.last_used
d.created_at
d.updated_at


# Returns ActiveRecord array of apps from a specific platform
d.android
d.ios
d.windows
d.chrome

# Group apps by `platform`
d.platforms

# Group apps by `url`
d.apps
```

#### Helpers

NativeGap on Rails adds some helpers which are available in your controllers and views:

* `current_app` `App` record related to current session. Returns `nil` when the Rails app is being used normally.

* `current_platform` Lowercase string of current platform. Returns `'web'` when the Rails app is being used normally.

### Notifications

You can enable native notifications on most platforms. To handle notifications NativeGem integrates with [OneSignal](https://onesignal.com). You could use the [NotificationsRails](https://github.com/jonhue/notifications-rails) gem and implement the [notification-pusher-onesignal](https://github.com/jonhue/notifications-rails/tree/master/notification-pusher/notification-pusher-onesignal) component to push notifications to your native applications. [OnSignal](https://github.com/jonhue/onsignal) assists you with managing OneSignal along with a user authentication system.

---

## Configuration

You can configure NativeGap on Rails by passing a block to `configure`. This can be done in `config/initializers/nativegap.rb`:

```ruby
NativeGap.configure do |config|
    config.android = true
end
```

* `#{platform}` Set to `false` to disable the platform. Takes a boolean. Defaults to `true`.

---

## To Do

[Here](https://github.com/NativeGap/nativegap-rails/projects/1) is the full list of current projects.

To propose your ideas, initiate the discussion by adding a [new issue](https://github.com/NativeGap/nativegap-rails/issues/new).

---

## Contributing

We hope that you will consider contributing to NativeGap on Rails. Please read this short overview for some information about how to get started:

[Learn more about contributing to this repository](CONTRIBUTING.md), [Code of Conduct](CODE_OF_CONDUCT.md)

### Contributors

Give the people some :heart: who are working on this project. See them all at:

https://github.com/NativeGap/nativegap-rails/graphs/contributors

### Semantic Versioning

NativeGap on Rails follows Semantic Versioning 2.0 as defined at http://semver.org.

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
