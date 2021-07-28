// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import 'scss/site'
import 'js/site'
import "chartkick/chart.js"
import "@hotwired/turbo-rails"

// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

Rails.start()
ActiveStorage.start()

// Stimulus: requires all of the controllers in the app/components directory. (index)
// const componentContext = require.context("../../components/", true, /(.*)\/.+\.js$/);
// application.load(definitionsFromContext(componentContext));

import "controllers"
