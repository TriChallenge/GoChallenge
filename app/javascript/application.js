// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "bootstrap"
import "@popperjs/core"
import { Tooltip, Toast, Popover } from 'bootstrap'

import Rails from "@rails/ujs"
Rails.start()

document.addEventListener("turbo:load", () => {
  // Initialize tooltips, popovers, etc.
  var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
  var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
    return new Tooltip(tooltipTriggerEl)
  })
})
