// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import { Turbo } from "@hotwired/turbo-rails"
import "@hotwired/turbo-rails"
import "controllers"
import "channels"
Turbo.session.drive = true