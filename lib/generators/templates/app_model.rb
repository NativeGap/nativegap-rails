class Native::App < ActiveRecord::Base

    self.table_name = 'native_apps'

    include Native::AppLib

    belongs_to Native.configuration.devise_class.downcase.to_sym, optional: true

end
