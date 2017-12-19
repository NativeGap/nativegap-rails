require 'native/version'

module Native

    autoload :Configuration, 'native/configuration'

    class << self
        attr_accessor :configuration
    end

    def self.configure
        self.configuration ||= Configuration.new
        yield configuration
    end

    class Engine < ::Rails::Engine
        # isolate_namespace Native
    end

end
