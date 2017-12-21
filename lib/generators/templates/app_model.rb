class Native::App < ActiveRecord::Base

    self.table_name = 'native_apps'

    include Native::AppLib

    belongs_to :owner, polymorphic: true, optional: true

end
