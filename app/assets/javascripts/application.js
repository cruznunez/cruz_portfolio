//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
function lockNav() {
  var headerHeight = $('.page-header').outerHeight( true );
  var windowHeight = $(window).height();
  var contactInfoHeight = $('div.container-black').outerHeight( true );
  var blackHeight = windowHeight + headerHeight - contactInfoHeight
  if($(window).scrollTop() > headerHeight && $(window).width() > 672){
    if($('#nav').css('position') == 'absolute'){
      $('#nav').css({'position' : 'fixed', 'margin-top' : '0', 'top' : '5vh'});
      $('div.container-black').css({'position' : 'fixed', 'bottom' : '0', 'top' : ''});
    };
  }else{
    if($('#nav').css('position') == 'fixed'){
      $('#nav').css({ 'position' : 'absolute', 'top' : '', 'margin-top' : ''});
      $('div.container-black').css({'position' : 'absolute', 'bottom': '', 'top' : blackHeight });
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
  $('div.container-black').css('top', blackHeight );
}

function resetColor() {
  $(window).on("load", function() {
    css = $('style').last().html();
  });

  $(window).on("load resize", function(e){
    if ($(window).width() > 672) {
      $('style').last().html("");
    } else {
      $('style').last().html( css );
    };
  });
};

$(placeInitialBlackContactInfo);
$(masterLock);
$(makeAllLinksOpenInNewWindowExceptForNavigation);
$(resetColor);
