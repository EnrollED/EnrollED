Enrolled.application_forms = {

    form: function() {

        $('.date').datetimepicker({
            format: 'DD.MM.YYYY',
            extraFormats: [moment.ISO_8601]
        });

        $('#same_as_residence, #application_place_of_residence, #application_post_of_residence_id').change(function(){
            if($('#same_as_residence').is(":checked")) {
                $('#application_firstname_for_notification').val($('#application_user_firstname').val());
                $('#application_lastname_for_notification').val($('#application_user_lastname').val());
                $('#application_place_for_notification').val($('#application_place_of_residence').val());
                $('#application_post_for_notification_id').val($('#application_post_of_residence_id').val());
            }else{
                $('#application_firstname_for_notification').val('');
                $('#application_lastname_for_notification').val('');
                $('#application_place_for_notification').val('');
                $('#application_post_for_notification_id').val('');
            }
        });
    }
};