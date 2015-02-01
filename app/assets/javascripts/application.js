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
//= require bootstrap-sprockets
//= require flat-ui
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).ready(function(){
  $('#pictures li a').on('click', function(e) {
    e.preventDefault();

    var link = $(this);
    var img  = link.children("img");

    $('#pictureModal').modal();
    $('#pictureModal').on('shown.bs.modal', function(){
      $('#pictureModal .modal-title').html(img.attr('title'));
      $('#pictureModal .modal-body').html('<img src="' + link.attr('href') + '" class="img-responsive"/>');
      $('#pictureModal .modal-footer').html(img.data('description'));
    });
    $('#pictureModal').on('hidden.bs.modal', function(){
      $('#pictureModal .modal-title').html('');
      $('#pictureModal .modal-body').html('');
      $('#pictureModal .modal-footer').html('');
    });
  });
});
