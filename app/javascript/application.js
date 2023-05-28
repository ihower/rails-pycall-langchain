// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
// import "@hotwired/turbo-rails"
// import "controllers"
import "bootstrap"
import '@popperjs/core'
import $ from 'jquery';
window.$ = $;

import Rails from '@rails/ujs';
Rails.start();

import * as ActiveStorage from "@rails/activestorage"
ActiveStorage.start()

import { createConsumer } from "@rails/actioncable"

window.createConsumer = createConsumer;
