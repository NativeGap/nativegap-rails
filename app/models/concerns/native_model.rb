module NativeModel

    extend ActiveSupport::Concern

    module ClassMethods
        def nativegap
            has_many :nativegap_apps, class_name: 'NativeGap::App', as: :owner, dependent: :destroy
        end
    end

end
