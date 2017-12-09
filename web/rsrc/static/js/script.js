var search_type = 0;
function search_type_func(x){
    search_type = x;
    if (x == 1){
        $('#return-airport-select').prop('disabled', false);
        $('#return-airport').show();
        $('#airport-3-select').prop('disabled', true);
        $('#airport-3').hide();
        $('#date-2-containter').hide();
        $('#date-2').prop('disabled', true);

    } else if (x == 2){
        $('#return-airport-select').prop('disabled', false);
        $('#return-airport').show();

        $('#date-2-containter').show();
        $('#date-2').prop('disabled', false);


        $('#airport-3-select').prop('disabled', true);
        $('#airport-3').hide();


    } else if (x == 3){
        $('#return-airport-select').prop('disabled', false);
        $('#return-airport').show();

        $('#date-2-containter').show();
        $('#date-2').prop('disabled', false);

        $('#airport-3-select').prop('disabled', false);
        $('#airport-3').show();

    }
}

function valid_submit(){
    return true;
}