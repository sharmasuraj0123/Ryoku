function search_type_func(x){
    if (x == 1){
        $('#return-airport-select').prop('disabled', true);
        $('#return-airport').hide();
        $('#airport-3-select').prop('disabled', true);
        $('#airport-3').hide();
    }
}