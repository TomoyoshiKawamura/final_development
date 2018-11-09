$(function() {
    $('.search-item-name, .inside-of-shopping-cart-item__explanation-title, .recommend-item-name').hover(function() {
        $(this).css('color', '#c4562b'); //文字の色を変更する　色は元サイトに準じている
    }, function() {
        $(this).css('color', '');
    });
});