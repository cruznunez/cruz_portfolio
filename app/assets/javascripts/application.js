//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
function lockNav() {
  var headerHeight = $('.page-header').outerHeight( true );
  var windowHeight = $(window).height();
  var contactInfoHeight = $('div.container-black').outerHeight( true );
  var blackHeight = windowHeight + headerHeight - contactInfoHeight
  if ($(window).width() > 672) {
    if($(window).scrollTop() > headerHeight ){
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
  }else{
    $('#nav').css({ 'position' : '', 'top' : '', 'margin-top' : ''});
  }
};

function masterLock() {
  $( window ).on("resize scroll",lockNav);
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

$(placeInitialBlackContactInfo);
$(masterLock);
$(makeAllLinksOpenInNewWindowExceptForNavigation);
