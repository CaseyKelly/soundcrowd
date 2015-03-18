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
    { src: 'http://static1.squarespace.com/static/54433764e4b09e0c2c24e17b/544347bae4b02d01b1738a29/5444565ce4b0ef2fa0b33a2b/1414033479399/1-TYH_8865.jpg?format=1000w' },
    { src: 'http://static1.squarespace.com/static/54433764e4b09e0c2c24e17b/544347bae4b02d01b1738a29/544457d3e4b01431efe8df33/1413765077900/TYH_7186.jpg?format=1000w' },
    { src: 'http://static1.squarespace.com/static/54433764e4b09e0c2c24e17b/544347bae4b02d01b1738a29/544727b0e4b014352f0c6cf7/1414033755951/TYH_7600+-+Version+2.jpg?format=1000w' },
    { src: 'http://static1.squarespace.com/static/54433764e4b09e0c2c24e17b/544347bae4b02d01b1738a29/54486481e4b029c53cbce28a/1414034083697/TYH_4254.jpg?format=1000w' },
    { src: 'http://static1.squarespace.com/static/54433764e4b09e0c2c24e17b/544347bae4b02d01b1738a29/5444569fe4b01431efe8dc2a/1414042991181/5-%281+of+1%29TYH_1450.jpg?format=1000w'}
  ]
});

}

  facebookShare =  function(d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.0";
    fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk');
