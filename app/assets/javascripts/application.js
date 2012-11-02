// This is a manifest file that will be compiled into application.js, which will include all the files
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
//= require jquery.isotope
//= require bootstrap
//= require_tree .
$(document).ready(function(){

    // Hide home page hero unit
    $('#hero-unit-close').click(function(){
        $('#main-hero-unit').hide();
    });


    // Sort Links
    $('.sortable').sortable({
      items: '> .sortItem',
      stop: function(event,ui) {
          //console.log("New position:" + ui.item.index());
          var sortedLinkages = $('.sortable').sortable('serialize');
          if (sortedLinkages !== previouslySorted) {
              previouslySorted = sortedLinkages;
              saveSortedLinkages(sortedLinkages);
          }
      }
    });
    var previouslySorted = $('.sortable').sortable('serialize');
    function saveSortedLinkages(sortedLinkages) {
        $.ajax({
            type:     'POST',
            url:      "linkages/order.js",
            async:    true,
            data: sortedLinkages,
            success: function(data) {
                //console.log(data);
            },
            error: function(data) {
                alert(data);
            }
        });
    }

    // Delete Linkages & Link
    $('.deleteLinkage')
        //.live('ajax:beforeSend', function(evt, xhr, settings) {console.log('IT IS BEING SEND');})
        //.live('ajax:complete', function(evt, xhr, status) {console.log('ITS COMPLETE');})
        .live('ajax:success', function(evt, data, status, xhr) {
            $(this).parents(".bookmark").remove()
        })
        .live('ajax:error', function(evt, xhr, status, error) {
            alert('IT IS ERROR');
        });

    function searchWebsite(website) {
        var url = $(website);
        //console.log($(url).attr('href'));
        var faviconURL = url.attr('href')
    }

    /*
    $("a[href^='http']").live('change').each(function() {
        $(this).css({
            background: "url(http://g.etfv.co/" + this.href +
            ") left center no-repeat",
            "padding-left": "20px",
            "background-size": "16px 16px"
        });
    });
    */

});