$ ->

  # Top menu
  $('.show-menu a, .hide-menu a').tooltip()

  $('.show-menu a').on 'click', (e) ->
    e.preventDefault()

    $(@).fadeOut 100, ->
      $('header[role=navigation] nav').slideDown()

  $('.hide-menu a').on 'click', (e) ->
    e.preventDefault()

    $('header[role=navigation] nav').slideUp ->
      $('.show-menu a').fadeIn()

  $('header[role=navigation]').children('nav').children('a').on 'click', (e) ->
    e.preventDefault()

    elementClass = $(@).attr('class').replace /menu-/, ""
    scrollTo = $('.' + elementClass).offset().top
    # navHeight = $('header[role=navigation] nav').height()

    console.log "elementClass: #{elementClass}"
    console.log "scrollTo: #{scrollTo}"
    # console.log "navHeight: #{navHeight}"
    #
    # if $(window).scrollTop() != scrollTo && elementClass != undefined
    #   $('html, body').animate scrollTop: scrollTo, 1000