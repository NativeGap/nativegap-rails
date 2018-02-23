# Changelog

### master

* nothing yet

### 3.0.3 - 2018/02/23

* bugfixes
    * fixed `uninitialized constant NativeGap::Railtie::NativeGapHelper`

### 3.0.2 - 2018/02/23

* bugfixes
    * fixed `uninitialized constant NativeGap::Railtie::NativeGapModel`

### 3.0.1 - 2018/02/09

* enhancements
    * remove unnecessary configuration options

### 3.0.0 - 2018/02/09

* features
    * streamlined `App` model
    * parameter based apps

### 2.1.4 - 2018/01/06

* enhancements
    * cleaning up gem files

### 2.1.3 - 2018/01/02

* enhancements
    * automatically include helper in controllers
* bugfixes
    * fixed overriding `set_nativegap_user` method

### 2.1.2 - 2018/01/02

* bugfixes
    * fixed overriding `set_nativegap_user` method

### 2.1.1 - 2017/12/28

* bugfixes
    * fixed `uses_native_apps` method

### 2.1.0 - 2017/12/28

* features
    * introduced `uses_native_apps` method to ActiveRecord models
* bugfixes
    * fixed assets precompilation for native platforms

### 2.0.1 - 2017/12/21

* bugfixes
    * fixed `undefined method 'set_device_owner' for ApplicationController:Class`

### 2.0.0 - 2017/12/21

* features
    * made Devise optional
    * added `owner` association to `App` model

### 1.0.0 - 2017/12/20

* initial release
