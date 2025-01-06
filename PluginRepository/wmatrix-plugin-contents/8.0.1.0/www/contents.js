var exec = require('wmatrix/exec');

module.exports = {
    imagePicker: function(callback, param){
        if(param.camera){
            navigator.camera.getPicture(function(r){callback([r])},param.cameraoption);
        } else {
            exec(callback,"WMContentsPlugin","imagePicker",[param]);
        }
    },
    filePicker: function(callback, param) {
        exec(callback,"WMContentsPlugin","filePicker",[param]);
    },
    fileDownload: function(callback, param) {
        exec(callback,"WMContentsPlugin","fileDownload",[param]);
    }
};
