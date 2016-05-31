// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

Enrolled.study_programs = {

    index: function() {

        $('#faculty_id, #type_of_study_id, #mode_of_study_id, #column_ids').select2({
            width: '100%'
        });
    }
};