// Load all the controllers within this directory and all subdirectories. 
// Controller files must be named *_controller.js.

import { Application } from "stimulus"
import { definitionsFromContext } from "stimulus/webpack-helpers"
import Reveal from "stimulus-reveal-controller"
import Flatpickr from 'stimulus-flatpickr'

// Import style for flatpickr
require("flatpickr/dist/flatpickr.css")

const application = Application.start()
const context = require.context("/", true, /_controller\.js$/)
application.load(definitionsFromContext(context))

application.register("reveal", Reveal)
application.register('flatpickr', Flatpickr)


