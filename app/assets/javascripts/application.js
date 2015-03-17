// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require turbolinks
//= require vegas
//= require underscore
//= require gmaps/google
//= require_tree .


function backdrop() {

$('body').vegas({
  overlay: true,
  transition: 'fade',
  transitionDuration: 4000,
  delay: 10000,
  animation: 'random',
  animationDuration: 20000,
  slides: [
    { src: 'http://www.bighdwallpapers.com/wallpapers/music-beats-abstract-1920x1200.jpg' },
    { src: 'http://viscoinstrumentalmusicpgcps.weebly.com/uploads/2/4/7/4/24742341/6966130_orig.jpg' },
    { src: 'http://www.wallpapersgalaxy.com/wp-content/uploads/2013/04/99.jpg' },
    { src: 'http://www.listofimages.com/wp-content/uploads/2013/07/microphone-music-yellow-vector.jpg' }
  ]
});

}
