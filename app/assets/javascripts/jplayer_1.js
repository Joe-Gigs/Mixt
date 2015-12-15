   $(document).ready(function(){
      $("#jquery_jplayer_1").jPlayer({
          swfPath: "/assets/jplayerflash",
          supplied: "mp3",
          wmode: "window"
      });
      $('a.play').click(function(e) {
          e.preventDefault();
          $("#jquery_jplayer_1")
              .jPlayer("setMedia", {mp3: this.href })
              .jPlayer("play");
      });
    });