document.addEventListener("turbolinks:load", function() {
    $('li.current').parents('.menu-index').addClass('wp-has-current-submenu wp-menu-open');
})