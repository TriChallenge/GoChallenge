// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "bootstrap"
import "../stylesheets/application"
import "@popperjs/core"
import { Tooltip, Toast, Popover } from 'bootstrap'

import Rails from "@rails/ujs"
Rails.start()

import { Turbo } from "@hotwired/turbo-rails"
Turbo.session.drive = true

document.addEventListener('turbo:load', function () {
  console.log('Turbo Loaded');
});

document.addEventListener("turbo:load", () => {
  var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
  var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
    return new Tooltip(tooltipTriggerEl)
  })
});