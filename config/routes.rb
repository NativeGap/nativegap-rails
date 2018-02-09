Native::Engine.routes.draw do

    if Native.configuration&.android
        get 'android', to: 'native/platforms#android'
    end
    if Native.configuration&.ios
        get 'ios', to: 'native/platforms#ios'
    end
    if Native.configuration&.windows
        get 'windows', to: 'native/platforms#windows'
    end
    if Native.configuration&.chrome
        get 'chrome', to: 'native/platforms#chrome'
    end

end
