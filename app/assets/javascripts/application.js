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
//= require momentjs-2.13.0/moment
//= require momentjs-2.13.0/locales/sl
//= require bootstrap-datetimepicker-4.17.37/bootstrap-datetimepicker
//= require_self
//= require_tree .

// Global object for page specific funcions
window.Enrolled = {

    defaults: function () {

        $.fn.datetimepicker.defaults.allowInputToggle = true;
        $.fn.datetimepicker.defaults.icons = {
            time: 'fa fa-time',
            date: 'fa fa-calendar',
            up: 'fa fa-chevron-up',
            down: 'fa fa-chevron-down',
            previous: 'fa fa-chevron-left',
            next: 'fa fa-chevron-right',
            today: 'fa fa-screenshot',
            clear: 'fa fa-trash',
            close: 'fa fa-remove'
        };
    },

    init: function () {

        var lang = $(document.body).attr('lang') || 'sl';

        moment.locale(lang);

        $('[rel="tooltip"]').tooltip();
    },

    admin: {}
};

// App initialization
$(function () {
    Enrolled.defaults();
});

$(document).on('turbolinks:load', function () {

    Enrolled.init();
});