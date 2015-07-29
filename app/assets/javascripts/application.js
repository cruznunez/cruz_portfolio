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
//= require turbolinks
//= require_tree .
function lockNav() {
  var headerHeight = $('.page-header').outerHeight( true );
  var windowHeight = $(window).height();
  var contactInfoHeight = $('div.container.container-black').outerHeight( true );
  var blackHeight = windowHeight + headerHeight - contactInfoHeight
  if($(window).scrollTop() > headerHeight ){
    if($('#nav').css('position') == 'absolute'){
      $('#nav').css({'position' : 'fixed', 'margin-top' : '0', 'top' : '5vh'});
      $('div.container.container-black').css({'position' : 'fixed', 'bottom' : '0', 'top' : ''});
    };
  }else{
    if($('#nav').css('position') == 'fixed'){
      $('#nav').css({ 'position' : 'absolute', 'top' : '', 'margin-top' : ''});
      $('div.container.container-black').css({'position' : 'absolute', 'bottom': '', 'top' : blackHeight });
    };
  };
};

function masterLock() {
  $( window ).scroll(lockNav);
};

function makeAllLinksOpenInNewWindowExceptForNavigation() {
  $('a').attr('target', '_blank');
  $('nav a').attr('target', '_self');
  $('a.email').attr('target', '_self');
  $('a.phone').attr('target', '_self');
};

function placeInitialBlackContactInfo() {
  var headerHeight = $('.page-header').outerHeight( true );
  var windowHeight = $(window).height();
  var contactInfoHeight = $('div.container.container-black').outerHeight( true );
  var blackHeight = windowHeight + headerHeight - contactInfoHeight
  $('div.container.container-black').css('top', blackHeight );
}

$(placeInitialBlackContactInfo);
$(masterLock);
$(makeAllLinksOpenInNewWindowExceptForNavigation)
