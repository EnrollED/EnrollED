Enrolled.application_forms = {

    form: function() {

        $('.date').datetimepicker({
            format: 'DD.MM.YYYY',
            extraFormats: [moment.ISO_8601]
        });
    }
};