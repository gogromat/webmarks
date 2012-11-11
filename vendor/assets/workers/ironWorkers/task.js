var account = 'PhantomJS';
var page = require('webpage').create();

page.settings.loadImages = false;

page.open('http://mobile.twitter.com/' + account, function (status) {
  if (status === 'fail') {
      console.log('Error');
  } else {
    var num = page.evaluate(function () {
      var selector = 'div.profile td.stat.stat-last div.statnum';
      return document.querySelector(selector).innerText;
    });
    console.log('@' + account, 'has', num, 'followers');
  }
  phantom.exit();
});