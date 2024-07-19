// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "bootstrap"
import "../stylesheets/application"
import "@popperjs/core"
import { Tooltip, Toast, Popover } from 'bootstrap'
//= require jquery3
//= require popper
//= require bootstrap-sprockets

document.addEventListener("turbo:load", () => {
  // Initialize tooltips, popovers, etc.
  var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
  var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
    return new Tooltip(tooltipTriggerEl)
  })
})