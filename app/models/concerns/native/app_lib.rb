module Native
    module AppLib

        extend ActiveSupport::Concern

        included do
            scope :android, -> { where(platform: 'android') }
            scope :ios, -> { where(platform: 'ios') }
            scope :uwp, -> { where(platform: 'uwp') }
            scope :chrome, -> { where(platform: 'chrome') }
            scope :platforms, -> { group_by(&:platform) }
            scope :apps, -> { group_by(&:url) }
        end

    end
end
