"use strict";

(function($) {
  // Returns a function, that, as long as it continues to be invoked, will not
  // be triggered. The function will be called after it stops being called for
  // N milliseconds. If `immediate` is passed, trigger the function on the
  // leading edge, instead of the trailing.
  function debounce(func, wait, immediate) {
    var timeout;
    return function() {
      var context = this,
        args = arguments;
      var later = function() {
        timeout = null;
        if (!immediate) func.apply(context, args);
      };
      var callNow = immediate && !timeout;
      clearTimeout(timeout);
      timeout = setTimeout(later, wait);
      if (callNow) func.apply(context, args);
    };
  };

  $.fn.sticky_sidebar = function(opts) {
    return this.each(function () {
      var $this = $(this);
      var $parent = $(this).parent();
      var $window = $(window);
      var parentPadding = parseInt($parent.css('padding-bottom'), 10);
      var offset = parseInt($(this).css('top'), 10);

      // This function will calculate the position of the sidebar
      var setElementPosition = function() {
        $this.css({
          top: $window.scrollTop() + offset
        })

        if (($this.offset().top + $this.height()) > ($parent.offset().top + $parent.height() + parentPadding)) {
          $this.css({
            top: ($parent.height() + parentPadding) - $this.height()
          })
        }
      }

      // Leverage the debounce method so we don't overload the browser
      $(window).on('scroll', debounce(function(e){
        // If the position is static, we're in a narrow viewport
        if ($this.css('position') == 'static') {
          return;
        }

        // If it is not in a narrow viewport, position the sidebar
        setElementPosition();
      }, 2, true));
    });
  };

  if ($('body').hasClass('blog')) {
    blog_anchor_redirect();
    detect_pi_browser();
    $('.floating-sidebar').sticky_sidebar();
  }

  if ($('body').hasClass('single-post')) {
    $('a.open-comments-top').click(toggle_comments_top);
    $('a.open-comments-bottom').click(toggle_comments_bottom);
  }

  $('#nav li.search').click(open_searchbar);
  $('#nav li.menu').click(open_mobile_menu);
  $('#nav li.close-menu').click(close_mobile_menu);
  $('.page-archive h2 a').click(open_archive_year);

  function blog_anchor_redirect() {
    var hash = window.location.hash;
    if (hash.length > 0) {
      var protocol = window.location.protocol + '//';
      var domain = window.location.host + '/';
      var slug = hash.replace('#', '');
      var permalink = protocol + domain + slug;
      if ($(hash).length == 0) {
        window.location.replace(permalink);
      }
    }
  }

  function detect_pi_browser() {
    var agent = navigator.userAgent.toLowerCase();

    var pi_browsers = [
      'epiphany',
      'midori',
      'dillo',
    ];

    for (var i=0; i<=pi_browsers.length; i++) {
      var browser = pi_browsers[i];

      if (agent.indexOf(browser) > -1) {
        $('body').addClass('rpi');
      }
    }
  }

  function open_searchbar() {
    $('#header form.search').toggleClass('open');
    $('#header form.search input.search').focus();
    return false;
  }

  function open_mobile_menu() {
    $('#nav ul').addClass('open');
    $('#header form.search').removeClass('open');
    return false;
  }

  function close_mobile_menu() {
    $('#nav ul').removeClass('open');
    return false;
  }

  function open_archive_year() {
    var year = $(this).attr('id').split('-')[1];
    $('#year-' + year).toggleClass('open');
    $(this).toggleClass('open');
    return false;
  }

  function toggle_comments_top() {
    toggle_comments();
    return true;
  }

  function toggle_comments_bottom() {
    toggle_comments();
    return false;
  }

  function toggle_comments() {
    $('.comments h2.comments-title').toggleClass('open');
    $('ol.commentlist').toggleClass('open');
    $('.comment-respond').toggleClass('open');
  }

})(jQuery);
