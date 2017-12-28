module Native
    module Owner

        def self.included base
            base.extend ClassMethods
        end

        module ClassMethods
            def uses_native_apps
                has_many :native_apps, class_name: 'Native::App', as: :owner, dependent: :destroy
            end
        end

    end
end
