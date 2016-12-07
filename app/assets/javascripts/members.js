$(function(){
  //検索した結果のhtml構造
  function removeUserHTML(user) {
    var html = (
      '<div class="list_user clearfix">' +
        '<div class="list_user--name">' +
          user.name +
        '</div>' +
        '<div class="list_user--button">' +
          '<a href="#" class="add" id=" ' +
            user.id +
          '" name="'+user.name+'">追加</a>' +
        '</div>' +
      '</div>'
    );
    return html;
  };
  // 追加ユーザーのhtml構造
  function addUserHTML(name, id) {
    var html = $(
      '<div class="list_user clearfix">' +
        '<input type="hidden" name="group[user_ids][]" value="' + id + '">' +
        '<div class="list_user--name">' +
          name +
        '</div>' +
        '<div class="list_user--button">' +
          '<a class="delete" href="#">' +
            '<span>削除</span>' +
          '</a>' +
        '</div>' +
      '</div>'
    );
    return html;
  };
  // インクルメンタルサーチ
  $('#user-search-field').on('keyup', function() {
    var textField = $(this);
    var name = textField.val();
    $('#user-search-result').empty();
    $.ajax({
      type: 'GET',
      url: '/users.json',
      data: {
        name: name
      },
      dataType: 'json'
    })
    .done(function(data) {
      var html = ''
      $.each(data,function(num, user){
        html += removeUserHTML(user);
        $('#user-search-result').html(html);
      });
    });
  });
  // ユーザーを追加
  $(document).on('click', '.add', function(e){
    e.preventDefault();
    var $this = $(this);
    var id = $this.attr('id');
    var name = $this.attr('name');;
    var html = addUserHTML(name,id);
    $("#chat-group-users").append(html);
    $this.parents(".list_user").remove();
  });
  // ユーザーを削除する
  $(document).on('click', '.delete', function(e){
    e.preventDefault();
    $(this).parents(".list_user").hide();
  });
});
