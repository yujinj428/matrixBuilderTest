var exec = require('wmatrix/exec');
    
module.exports = {
    getLog: function(callback, param){
        exec(callback,"WMLoggerPlugin","getLog",[param]);
    },
    clearLog: function(callback){
        exec(callback,"WMLoggerPlugin","clearLog",[]);
    },
    getLogUpload: function(callback, param){
        exec(callback,"WMLoggerPlugin","getLogUpload",[param]);
    },
    getLogMail: function(callback, param){
        exec(callback,"WMLoggerPlugin","getLogMail",[param]);
    },
    logPath: function(callback, param){
        exec(callback,"WMLoggerPlugin","logPath",[param]);
    }
};
