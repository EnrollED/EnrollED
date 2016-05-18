// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/turbolinks-5.0.0-beta4, vendor/assets/turbolinks-5.0.0-beta4,
// or any plugin's vendor/assets/turbolinks-5.0.0-beta4 directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery-2.2.3/jquery
//= require jquery-ujs-1.2.1/jquery-ujs
//= require turbolinks-5.0.0.beta4/turbolinks
//= require bootstrap-3.3.6/bootstrap
//= require select2-4.0.2/select2
//= require sweetalert-1.1.3/sweetalert
//= require_self
//= require_tree .

// Global object for page specific funcions
window.Enrolled = {
    init: function() {

        $('[rel="tooltip"]').tooltip();
    },

    admin: {}
};

// App initialization
$(document).on('turbolinks:load', function () {
    Enrolled.init();
});