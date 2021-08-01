// Load all the controllers within this directory and all subdirectories. 
// Controller files must be named *_controller.js.

import { Application } from "stimulus"
import { definitionsFromContext } from "stimulus/webpack-helpers"
import Reveal from "stimulus-reveal-controller"
import Flatpickr from 'stimulus-flatpickr'
import TextareaAutogrow from "stimulus-textarea-autogrow"
import { Alert, Autosave, Dropdown, Modal, Tabs, Popover, Toggle, Slideover } from "tailwindcss-stimulus-components"

// Import style for flatpickr
require("flatpickr/dist/flatpickr.css")

const application = Application.start()
const context = require.context("/", true, /_controller\.js$/)
application.load(definitionsFromContext(context))

application.register("reveal", Reveal)
application.register('flatpickr', Flatpickr)
application.register("textarea-autogrow", TextareaAutogrow)
application.register('alert', Alert)
application.register('autosave', Autosave)
application.register('dropdown', Dropdown)
application.register('modal', Modal)
application.register('tabs', Tabs)
application.register('popover', Popover)
application.register('toggle', Toggle)
application.register('slideover', Slideover)