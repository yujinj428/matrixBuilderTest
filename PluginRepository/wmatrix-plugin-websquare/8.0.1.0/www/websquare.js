var exec = require('wmatrix/exec');
    
module.exports = {
    excelDownload: function(success, fail, param) {
        
        var callback = function(result){
            if(result.statusCode == "1000"){
                success(result);
            } else {
                fail(result);
            }
        };
        
        exec(callback,"WMWebSquarePlugin","excelDownload",[param]);
    }
};
