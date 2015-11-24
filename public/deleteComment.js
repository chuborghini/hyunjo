function deleteComment() {
    var password = prompt("패스워드를 입력해주세요.");
    $('#comment_pw').val(password);
    $('#comment_del_form').submit();
}