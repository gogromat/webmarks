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


    $('#empty_link').children('img[src*=plus]').css('opacity','0.4');
    $('#newLinkageForm').hide();

    $('#empty_link').live({
        mouseover: function() {
            self = $(this);
            self.children('img[src*=plus]').css('opacity','1');
        },
        mouseout: function() {
            self = $(this);
            self.children('img[src*=plus]').css('opacity','0.4');
        },
        click: function() {
            console.log("some request in here");

            $('#newLinkageForm').show();



            //fetchNewLinkForm();
            //return false;
        }
    });

    $('.newLinkageSubmit').live('click', function() {
        $('#newLinkageForm').hide();
    });

    /*
    function fetchNewLinkForm() {
        $.get({
            url:       'this.href',
            async:     true,
            dataType:  'html',
            success: function(data) {
                console.log(data);
            },
            error: function(data) {
                console.log(data);
                alert("Sorry, please try again");
            }

        });
    }*/

});