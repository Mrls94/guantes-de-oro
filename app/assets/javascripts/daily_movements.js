$('document').ready(function(){
  $('.info-change').change(function(){
    var info = getInfoSelectedCurrency();
    setCashierValue(info);
    setTRM(info);
    refreshValueColombiaDivisa();
  })

  $("#daily_movement_value_foreign").change(function(){
    $("#daily_movement_value_colombia").attr('readOnly','readOnly');

    var value_colombia = $("#daily_movement_value_foreign").val() * $("#daily_movement_exchange_rate").val()

    $("#daily_movement_value_colombia").val(value_colombia)
  })

  $("#daily_movement_value_colombia").change(function(){
    $("#daily_movement_value_foreign").attr('readOnly','readOnly');

    var value_divisa = $("#daily_movement_value_colombia").val() / $("#daily_movement_exchange_rate").val()

    $("#daily_movement_value_foreign").val(value_divisa)
  })

  function refreshValueColombiaDivisa(){
    $("#daily_movement_value_foreign").removeAttr("readOnly")
    $("#daily_movement_value_colombia").removeAttr("readOnly")

    $("#daily_movement_value_foreign").val(0)
    $("#daily_movement_value_colombia").val(0)
  }

  function getInfoSelectedCurrency(){
    var selected_id = $('#daily_movement_currency_id :selected').val();
    var info_string = $('#currency_info').val();
    var info = JSON.parse(info_string)
    var selected_info = info.filter( function (obj){
      return (obj.currency_id + "") === (selected_id + "") 
    })
    
    return selected_info[0];
  }

  function setCashierValue(info){
    $(".currency-value-info").html(info.value);
  }

  function setTRM(info){
    var selected_action_id = $("#daily_movement_action :selected").val();
    var trm = 0;
    if ( selected_action_id === "0" ){
      trm = info.default_buy_rate
    } else {
      trm = info.default_sale_rate
    }

    $("#daily_movement_exchange_rate").val(trm);
  }
});