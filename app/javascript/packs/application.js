// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

// Load Flash Messages
global.toastr = require("toastr")

import Rails from "@rails/ujs"
//import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
//Turbolinks.start()
ActiveStorage.start()

// Import images to Webpacker
require.context('../images', true)

// Import JQuery
import JQuery from 'jquery';
window.$ = window.JQuery = JQuery;

// Import Bootstrap
import "bootstrap";
window.bootstrap = require('bootstrap/dist/js/bootstrap.bundle.js');

// Bootstrap toggle compatibility with Turbolinks
document.addEventListener("turbolinks:load", () => {
  $('[data-toggle="tooltip"]').tooltip()
  $('[data-toggle="popover"]').popover()
})

// Import stylesheets
import "../stylesheets/application"

// Import Fontawesome library
import "@fortawesome/fontawesome-free/css/all.css";
