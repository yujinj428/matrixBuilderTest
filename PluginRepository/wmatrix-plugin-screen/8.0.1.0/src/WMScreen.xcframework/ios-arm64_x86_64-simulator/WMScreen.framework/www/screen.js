var exec = require('wmatrix/exec');
    
module.exports = {
    startWebView: function(callback, param) {
        exec(callback,"WMScreenPlugin","startWebView",[param]);
    },
    closeSubWebView: function(callback) {
        exec(callback,"WMScreenPlugin","closeSubWebView",[]);
    },
    screenCapture: function(callback, param) {
        exec(callback,"WMScreenPlugin","screenCapture",[param]);
    },
    setupBrightness: function(callback, param){
        exec(callback,"WMScreenPlugin","setupBrightness",[param]);
    }
};
