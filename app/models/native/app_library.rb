class Native::AppLibrary < ApplicationRecord

    self.table_name = 'native_apps'

    belongs_to :owner, polymorphic: true, optional: true

    scope :android, -> { where(platform: 'android') }
    scope :ios, -> { where(platform: 'ios') }
    scope :windows, -> { where(platform: 'windows') }
    scope :chrome, -> { where(platform: 'chrome') }
    scope :platforms, -> { group_by(&:platform) }
    scope :apps, -> { group_by(&:url) }

end
