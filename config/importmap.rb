# Pin npm packages by running ./bin/importmap

pin "application", preload: true
#pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
#pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
#pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
#pin_all_from "app/javascript/controllers", under: "controllers"
pin "@rails/ujs", to: "https://ga.jspm.io/npm:@rails/ujs@7.0.4-3/lib/assets/compiled/rails-ujs.js"
pin "@rails/actioncable", to: "https://ga.jspm.io/npm:@rails/actioncable@7.0.4-3/app/assets/javascripts/actioncable.esm.js"
pin "@rails/activestorage", to: "https://ga.jspm.io/npm:@rails/activestorage@7.0.4-3/app/assets/javascripts/activestorage.esm.js"
pin "bootstrap", to: "https://ga.jspm.io/npm:bootstrap@5.2.1/dist/js/bootstrap.esm.js"
pin "@popperjs/core", to: "https://unpkg.com/@popperjs/core@2.11.6/dist/esm/index.js"
pin "jquery", to: "https://ga.jspm.io/npm:jquery@3.7.0/dist/jquery.js"
