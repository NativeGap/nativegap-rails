class Native {

    constructor( platform, options = {} ) {
        let defaults = {
            scale: 1.125
        }
        this._options = extend( {}, defaults, options );
        this._platform = platform;
    }

    get platform() {
        return this._platform;
    }
    set platform(val) {
        this._platform = val;
    }

    get options() {
        return this._options;
    }
    set options(val) {
        this._options = val;
    }

    scale() {
        document.querySelector(':root').style.fontSize = 16 * this.options.scale;
    }

}


function extend() {
    for ( let i=1; i<arguments.length; i++ )
        for ( let key in arguments[i] )
            if ( arguments[i].hasOwnProperty(key) )
                arguments[0][key] = arguments[i][key];
    return arguments[0];
};


export default Native;
