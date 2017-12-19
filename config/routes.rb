Native::Engine.routes.draw do

    if Native.configuration&.android
        get 'android', to: 'native/platforms#android'
    end
    if Native.configuration&.ios
        get 'ios', to: 'native/platforms#ios'
    end
    if Native.configuration&.uwp
        get 'uwp', to: 'native/platforms#uwp'
    end
    if Native.configuration&.chrome
        get 'chrome', to: 'native/platforms#chrome'
    end
    if Native.configuration&.osx
        get 'osx', to: 'native/platforms#osx'
    end
    if Native.configuration&.win32
        get 'win32', to: 'native/platforms#win32'
    end
    if Native.configuration&.win64
        get 'win64', to: 'native/platforms#win64'
    end
    if Native.configuration&.lin32
        get 'lin32', to: 'native/platforms#lin32'
    end
    if Native.configuration&.lin64
        get 'lin64', to: 'native/platforms#lin64'
    end

end
