var exec = require('wmatrix/exec');
    
module.exports = {
    toast: function(callback, param) {
        exec(callback,"WMViewPlugin","toast",[param]);
    },
    snackBar: function(callback, param){
        exec(callback,"WMViewPlugin","snackbar",[param]);
    },
    notification: function(callback, param){
        exec(callback,"WMViewPlugin","notification",[param]);
    }
};
