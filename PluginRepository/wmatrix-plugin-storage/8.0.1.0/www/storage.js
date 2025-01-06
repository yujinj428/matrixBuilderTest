var exec = require('wmatrix/exec');
    
module.exports = {
    getPreference: function(callback, param){
        exec(callback,"WMStoragePlugin","getPreference",[param]);
    },
    setPreference: function(callback, param){
        exec(callback,"WMStoragePlugin","setPreference",[param]);
    },
    removePreference: function(callback, param){
        exec(callback,"WMStoragePlugin","removePreference",[param]);
    },
    shareData: function(callback, param){
        exec(callback,"WMStoragePlugin","shareData",[param]);
    },
    reset: function(callback, param) {
        exec(callback,"WMStoragePlugin","appReset",[param]);
    }
};
