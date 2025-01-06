wmatrix.define('wmatrix/plugin_list', function(require, exports, module) {
    module.exports = [
  {
    "clobbers" : [
      "wmatrix.plugin.app"
    ],
    "pluginId" : "wmatrix-plugin-app",
    "id" : "wmatrix-plugin-app.app",
    "file" : "plugins/wmatrix-plugin-app/www/app.js"
  },
  {
    "clobbers" : [
      "device"
    ],
    "id" : "wmatrix-plugin-device.device",
    "file" : "plugins/wmatrix-plugin-device/www/device.js",
    "pluginId" : "wmatrix-plugin-device"
  },
  {
    "id" : "wmatrix-plugin-camera.Camera",
    "file" : "plugins/wmatrix-plugin-camera/www/CameraConstants.js",
    "pluginId" : "wmatrix-plugin-camera",
    "clobbers" : [
      "Camera"
    ]
  },
  {
    "file" : "plugins/wmatrix-plugin-camera/www/CameraPopoverOptions.js",
    "clobbers" : [
      "CameraPopoverOptions"
    ],
    "id" : "wmatrix-plugin-camera.CameraPopoverOptions",
    "pluginId" : "wmatrix-plugin-camera"
  },
  {
    "file" : "plugins/wmatrix-plugin-camera/www/Camera.js",
    "pluginId" : "wmatrix-plugin-camera",
    "id" : "wmatrix-plugin-camera.camera",
    "clobbers" : [
      "navigator.camera"
    ]
  },
  {
    "pluginId" : "wmatrix-plugin-camera",
    "id" : "wmatrix-plugin-camera.CameraPopoverHandle",
    "file" : "plugins/wmatrix-plugin-camera/www/ios/CameraPopoverHandle.js",
    "clobbers" : [
      "CameraPopoverHandle"
    ]
  },
  {
    "id" : "wmatrix-plugin-network.Connection",
    "pluginId" : "wmatrix-plugin-network",
    "file" : "plugins/wmatrix-plugin-network/www/Connection.js",
    "clobbers" : [
      "Connection"
    ]
  },
  {
    "file" : "plugins/wmatrix-plugin-network/www/network.js",
    "pluginId" : "wmatrix-plugin-network",
    "clobbers" : [
      "navigator.connection",
      "navigator.network.connection"
    ],
    "id" : "wmatrix-plugin-network.network"
  }
];
module.exports.metadata =
// TOP OF METADATA
{
  "wmatrix-plugin-camera" : {
    "version" : "7.4.1.0",
    "type" : "basic"
  },
  "wmatrix-plugin-device" : {
    "version" : "7.4.1.0",
    "type" : "basic"
  },
  "wmatrix-plugin-app" : {
    "version" : "7.4.1.0",
    "type" : "basic"
  },
  "wmatrix-plugin-network" : {
    "version" : "7.4.1.0",
    "type" : "basic"
  }
}
// BOTTOM OF METADATA
});
