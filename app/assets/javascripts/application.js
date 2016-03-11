//= require jquery
//= require jquery.minicolors
//= require jquery_ujs
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

function placeInitialBlackContactInfo() {
  var headerHeight = $('.page-header').outerHeight( true );
  var windowHeight = $(window).height();
  var contactInfoHeight = $('div.container.container-black').outerHeight( true );
  var blackHeight = windowHeight + headerHeight - contactInfoHeight
  $('div.container-black').css('top', blackHeight );
}

function readURL(input) {
  if (input.files && input.files[0]) {
    var reader = new FileReader();
    reader.onload = function(e){
      $('.project-pic').attr('src', e.target.result);
    };
    reader.readAsDataURL(input.files[0]);
  };
};

function showChosenProjectPic() {
  $("#projectPicFileField").change(function () {
    readURL(this);
  });
};

function addTechToProject() {
  $("select#add").change( function() {
    var project_id = $(this).closest(".project").attr("id");
    var tech_id = $("select#add option:selected")[0].value;
    $.ajax({
      url: "/projects/" + project_id + "/add_tech/" + tech_id,
      type: "PATCH",
    });
  });
};

function rmTechFromProject() {
  $("select#rm").change( function() {
    var project_id = $(this).closest(".project").attr("id");
    var tech_id = $("select#rm option:selected")[0].value;
    $.ajax({
      url: "/projects/" + project_id + "/rm_tech/" + tech_id,
      type: "DELETE",
    });
  });
};

function changeSiteColor() {
  $('.color').click( function() {
    var code = $(this).html();
    $('#color').val(code).change()
  });
}

$(placeInitialBlackContactInfo);
$(masterLock);
$(showChosenProjectPic);
$(addTechToProject);
$(rmTechFromProject);
$(keyBoardListener);
