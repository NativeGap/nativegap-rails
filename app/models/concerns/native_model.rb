module NativeModel

    extend ActiveSupport::Concern

    module ClassMethods
        def native
            has_many :native_apps, class_name: 'Native::App', as: :owner, dependent: :destroy
        end
    end

end
