// メッセージのAjax機能時のHTML設定
$(function() {

  function scrollToBottom() {
  $(".group-content").animate({ scrollTop: $('.messages').height() }, -300);
  };

  function buildHTML(message) {
    if (message.image){
      var image_place = '<div class= "message__image">' +
      '<img src= "' +
      message.image +
      '", class= "message-image">' +
      '</div>';
    } else{
      var image_place = '';
    };
    var html = (
      '<li>'+
      '<div class= "meassage clearfix">' +
      '<div class= "message__username">' +
      message.user_name +
      '</div>' +
      '<div class= "message__time">' +
      message.created_at +
      '</div>' +
      '</div>'+
      '<p class= "message__content">' +
      message.content +
      '</p>' +
      image_place +
      '</li>');
    return html;
  };

  function buildFLASH() {
    var flashHtml = $(
    '<div class= "alert alert-notice">' +
    '<div class= "container">' +
     '投稿しました' +
      '</div>' +
      '</div>'
      );
    return flashHtml;
  };
// メッセージ機能のAjax
  $('.js-message-form').on('submit', function(e) {
    e.preventDefault();
    var textField = $('.js-message-text');
    var message = textField.val();
    var submitButton = $(".js-message-submit");
    var $form = $(this).get(0);
    var fd = new FormData($form);
    $.ajax({
      type: 'POST',
      url:  location.href + '.json',
      data: fd,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data) {
      var html = buildHTML(data);
      var flash = buildFLASH();
      $('.messages').append(html);
      $(".js-flash-message").html(flash);
      textField.val('');
      submitButton.prop('disabled', false);
      scrollToBottom();
      $('input[class="input-image"]').val('');
    })
    .fail(function() {
      alert('送信できませんでした');
    });
  });
  $(document).on('change','input[class="input-image"]',function(){
    $('.js-message-submit').trigger("click");
  });
});
