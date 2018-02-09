module NativeGap

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

        def initialize
            @android = true
            @ios = true
            @windows = true
            @chrome = true
        end

    end
end
