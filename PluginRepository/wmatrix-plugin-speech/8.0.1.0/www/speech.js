var exec = require('wmatrix/exec');
    
module.exports = {
    startSpeechToText: function(callback, param){
        exec(callback,"WMSpeechPlugin","startSpeechToText",[param]);
    },
    stopSpeechToText: function(callback, param){
        exec(callback,"WMSpeechPlugin","stopSpeechToText",[param]);
    },
    speakTTS: function(callback, param){
        exec(callback,"WMSpeechPlugin","speakTTS",[param]);
    },
    stopTTS: function(callback, param){
        exec(callback,"WMSpeechPlugin","stopTTS",[param]);
    }
};
