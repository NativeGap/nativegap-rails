module Native

    class << self
        attr_accessor :configuration
    end

    def self.configure
        self.configuration ||= Configuration.new
        yield configuration
    end

    class Configuration

        attr_accessor :android
        attr_accessor :ios
        attr_accessor :windows
        attr_accessor :chrome
        attr_accessor :android_url
        attr_accessor :ios_url
        attr_accessor :windows_url
        attr_accessor :chrome_url

        def initialize
            @android = true
            @ios = true
            @windows = true
            @chrome = true
            @android_url = 'root_url'
            @ios_url = 'root_url'
            @windows_url = 'root_url'
            @chrome_url = 'root_url'
        end

    end
end
