// Load all the controllers within this directory and all subdirectories. 
// Controller files must be named *_controller.js.

import { Application } from "stimulus"
import { definitionsFromContext } from "stimulus/webpack-helpers"
import Reveal from "stimulus-reveal-controller"

const application = Application.start()
const context = require.context("/", true, /_controller\.js$/)
application.load(definitionsFromContext(context))

application.register("reveal", Reveal)
