// メッセージのAjax機能時のHTML設定
$(function() {

  function scrollToBottom() {
  $(".group-content").animate({ scrollTop: $('.messages').height() }, 300);
  };

  function buildHTML(message) {
    var html = $(
      '<li>'+
      '<div class="meassage clearfix">' +
      '<div class="message__username">' +
      message.user_name +
      '</div>' +
      '<div class="message__time">' +
      message.created_at +
      '</div>' +
      '</div>'+
      '<p class="message__content">' +
      message.content +
      '</p>' +
      '</li>');
    return html;
  };

  function buildFLASH() {
    var flashHtml = $(
    '<div class="alert alert-notice">' +
    '<div class="container">' +
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
      $("html").prepend(flash);
      textField.val('');
      submitButton.prop('disabled', false);
      scrollToBottom();
    })
    .fail(function() {
      alert('送信できませんでした');
    });
  });
});
