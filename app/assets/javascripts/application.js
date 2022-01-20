// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require popper
//= require bootstrap
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require fullcalendar
//= require moment
//= require_tree.

    document.addEventListener('turbolinks:load', function() {
        if (('#RealtimeClockArea').length) {
            setInterval('showClock()',100);
        }
    });

    function showClock(){
      var nowTime = new Date(); //  現在日時を得る
      var nowHour = nowTime.getHours(); // 時を抜き出す
      var nowMin  = nowTime.getMinutes(); // 分を抜き出す
      var nowSec  = nowTime.getSeconds(); // 秒を抜き出す
      var msg = ( '00' + nowHour ).slice( -2 ) + ":" + ( '00' + nowMin ).slice( -2 ) + ":" + ( '00' + nowSec ).slice( -2 );
      // document.getElementById("RealtimeClockArea").innerHTML = msg;
      ('#RealtimeClockArea').text(msg);
    }

    (function () {

  ('#calendar').fullCalendar({

  });

});