// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery.ui.all
//= require jquery_ujs
//= require bootstrap
//= require_tree .
$(document).ready(function(){

    $('#hero-unit-close').click(function(){
        $('#main-hero-unit').hide();
    });


    $('.sortable').sortable();


    //$('#newLinkageForm').hide();

    $('#empty_link').live({
        mouseover: function() {
        },
        mouseout: function() {
        },
        click: function() {
            //console.log("some request in here");
            $('#newLinkageForm').show();
        }
    });


    $('.deleteLinkage')
        //.live('ajax:beforeSend', function(evt, xhr, settings) {console.log('IT IS BEING SEND');})
        //.live('ajax:complete', function(evt, xhr, status) {console.log('ITS COMPLETE');})
        .live('ajax:success', function(evt, data, status, xhr) {
            $(this).parent().remove();
        })
        .live('ajax:error', function(evt, xhr, status, error) {
            console.log('IT IS ERROR');
            console.log(error);
            console.log(xhr);
            console.log(evt);
        });
});