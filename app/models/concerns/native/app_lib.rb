module Native
    module AppLib

        extend ActiveSupport::Concern

        included do
            scope :android, -> { where(platform: 'android') }
            scope :ios, -> { where(platform: 'ios') }
            scope :uwp, -> { where(platform: 'uwp') }
            scope :chrome, -> { where(platform: 'chrome') }
            scope :osx, -> { where(platform: 'osx') }
            scope :win32, -> { where(platform: 'win32') }
            scope :win64, -> { where(platform: 'win64') }
            scope :lin32, -> { where(platform: 'lin32') }
            scope :lin64, -> { where(platform: 'lin64') }
            scope :platforms, -> { group_by(&:platform) }
            scope :apps, -> { group_by(&:url) }
        end

    end
end
