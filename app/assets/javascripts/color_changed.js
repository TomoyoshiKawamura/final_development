$(function() {
    $('.search-item-name, .inside-of-shopping-cart-item__explanation-title').hover(function() {
        $(this).css('color', '#c4562b'); //文字の色を変更する　色は元サイトに準じている
    }, function() {
        $(this).css('color', '');
    });
});