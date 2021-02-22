/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

import { Turbo, cable } from "@hotwired/turbo-rails"

import { Application } from "stimulus"
import ContentLoader from "stimulus-content-loader"
import Prefetch from "stimulus-prefetch"
import Reveal from "stimulus-reveal-controller"

const application = Application.start()
application.register("reveal", Reveal)
application.register("content-loader", ContentLoader)
application.register("prefetch", Prefetch)

import "controllers"
