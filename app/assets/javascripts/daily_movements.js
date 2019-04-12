$('document').ready(function(){
  $("form").keypress(function(e) {
    //Enter key
    if (e.which == 13) {
      return false;
    }
  });
  
  $('.info-change').change(function(){
    var info = getInfoSelectedCurrency();
    setCashierValue(info);
    setTRM(info);
    refreshValueColombiaDivisa();
    setCompraTRM(info);
  })

  $("#daily_movement_value_foreign").change(function(){
    $("#daily_movement_value_colombia").attr('readOnly','readOnly');

    setValueColombia();
  })

  $("#daily_movement_value_colombia").change(function(){
    $("#daily_movement_value_foreign").attr('readOnly','readOnly');

    setValueForeign();
  })

  $("#daily_movement_exchange_rate").change(function(){
    var attr = $("#daily_movement_value_colombia").attr("readOnly")
    if (typeof attr !== typeof undefined && attr !== false){
      setValueColombia();
    } else {
      setValueForeign();
    }
  })

  function setValueColombia(){
    var value_colombia = $("#daily_movement_value_foreign").val() * $("#daily_movement_exchange_rate").val()
    var value_colombia_new = roundBasedOnAction(value_colombia);
    $("#daily_movement_value_colombia").val(value_colombia_new)
  }

  function setValueForeign(){
    var value_divisa = $("#daily_movement_value_colombia").val() / $("#daily_movement_exchange_rate").val()
    var value_divisa_new = roundBasedOnAction(value_divisa);
    $("#daily_movement_value_foreign").val(value_divisa_new)
  }

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

  function setCompraTRM(info){
    $(".currency-value-info-trm").html(info.compra_trm)
  }

  function roundBasedOnAction(value){
    var selected_action_id = $("#daily_movement_action :selected").val();
    if ( selected_action_id === "0" ){
      var new_value = Math.ceil(value);
    } else {
      var new_value = Math.floor(value);
    }

    return new_value;
  }
});