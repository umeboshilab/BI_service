process.env.NODE_ENV = process.env.NODE_ENV || 'development'

const environment = require('./environment')

// const HardSourceWebpackPlugin = require('hard-source-webpack-plugin');
// environment.plugins.prepend('HardSourceWebpackPlugin', new HardSourceWebpackPlugin());

// environment.splitChunks()

module.exports = environment.toWebpackConfig()
