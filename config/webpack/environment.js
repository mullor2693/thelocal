const { environment } = require('@rails/webpacker');
const webpack = require('webpack');
var path = require('path');

environment.plugins.append('Provide', new webpack.ProvidePlugin({
 $: 'jquery',
 jQuery: 'jquery',
 Popper: ['popper.js', 'default']
}));

environment.config.merge({
  resolve: {
      alias: {
          "javascript": path.join(__dirname, "..", "..",  "/app/javascript"),
          "channels": path.join(__dirname, "..", "..",  "/app/javascript/channels"),
      }
  }
})

module.exports = environment;