$(document).ready(function() {
    $('.cajitas img').on('click', function() {
        $(this).siblings('input[type=radio]').prop('checked', true);
    });
});
