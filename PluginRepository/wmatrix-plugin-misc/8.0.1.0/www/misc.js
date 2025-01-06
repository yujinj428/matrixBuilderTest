var exec = require('wmatrix/exec');
    
module.exports = {
    openBrowser: function(callback, param) {
        exec(callback,"WMMiscPlugin","openBrowser",[param]);
    },
    settingStatus: function(callback, data){
        exec(callback,"WMMiscPlugin","settingStatus",[data]);
    },
    sendCall: function(callback, param){
        exec(callback,"WMMiscPlugin","sendCall",[param]);
    },
    sendSMS: function(callback, param){
        exec(callback,"WMMiscPlugin","sendSMS",[param]);
    },
    getContacts: function(callback){
        exec(callback,"WMMiscPlugin","getContacts",[]);
    },
    getServerIp: function(callback){
        exec(callback,"WMMiscPlugin","getServerIp",[]);
    }
};
