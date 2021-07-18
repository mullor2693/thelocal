const { environment } = require('@rails/webpacker');

const webpack = require('webpack');

environment.plugins.append('Provide', new webpack.ProvidePlugin({
 $: 'jquery',
 jQuery: 'jquery',
 Popper: ['popper.js', 'default']
}));

const config = environment.toWebpackConfig();

config.resolve.alias = {
 jquery: 'jquery'
};

environment.config.merge({
  resolve: {
      alias: {
          "javascript": path.join(__dirname, "..", "..",  "/app/javascript"),
          "channels": path.join(__dirname, "..", "..",  "/app/javascript/channels"),
      }
  }
})

module.exports = environment;