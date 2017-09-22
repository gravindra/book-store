// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require_tree .

$(document).ready(function(){

  $(".qty-editable").change(function(){
    var product_id = $(this).data("message");
    var qty = parseFloat($(this).val());
    var price = parseFloat($('#product_sub_total_' + product_id).data('message'));
    var line_total = parseFloat(qty * price).toFixed(2);
    $('#product_total_' + product_id).text(line_total+'$');

    var _total = calcTotal();

    var params = {
        cart_items: {
          product_id: product_id,
          quantity: qty
        },
        order_details: {
          sub_total: line_total,
          total: _total
        }
      };
    var url = "/cart_items/1";
    ajax_call($(this), params, url, "PATCH", function(data){

        $("#total").text(_total.toFixed(2)+'$');
        // calcTotalItemsInCart();
        $(this).prop('disabled', false);
      });
  });

  var calcTotal = function() {
    var _total = 0;
    $(".line-total").each(function(){
      _total += parseFloat($(this).text());
    });
    return _total;
  }

  var calcTotalItemsInCart = function() {
    var _totalItemsInCart = 0;
    $(".qty").each(function(){
      _totalItemsInCart += parseInt($(this).val());
    });
    $("#cart").html("<i class='fa fa-shopping-cart'></i> " + _totalItemsInCart);
  }

  var ajax_call = function(elem, params, url, method, callback){
    $.ajax({
      method: method,
      url: url,
      data: params,
      beforeSend: function(){

        elem.prop("disabled", true);
      },
      success: function(data){
        elem.prop("disabled", false);
        callback(data);
      },
      error: function(){
        Materialize.toast(elem.data("An error occured. Please try again"), 5000, "rounded");
      },
      complete: function(){
      }
    });
  };
})