$ ->

  DEBUT_DATE = "2014/4/1"

  COUNTDOWN_BGNDS = [
    "assets/backgrounds/free_blue_sky.jpg"
    "assets/backgrounds/free_computer_2pers.jpg"
    "assets/backgrounds/free_laptop_wood.jpg"
  ]

  ABOUT_YOU_BGNDS = "assets/backgrounds/2.jpg"

  ABOUT_US_BGNDS = "assets/backgrounds/free_redbricks.jpg"

  # PAGE NAVIGATION

  $('.show-menu a, .hide-menu a').tooltip()

  $('.show-menu a').on 'click', (e) ->
    e.preventDefault()

    $(@).fadeOut 100, ->
      $('header[role=banner] nav').slideDown()

  $('.hide-menu a').on 'click', (e) ->
    e.preventDefault()

    $('header[role=banner] nav').slideUp ->
      $('.show-menu a').fadeIn()

  $('header[role=banner]').children('nav').children('a').on 'click', (e) ->
    e.preventDefault()

    elementId = $(@).attr('class').replace /menu-/, "#"
    scrollTop = $(window).scrollTop()
    scrollTo = $(elementId).offset().top
    navHeight = $('header[role=banner] nav').height()

    if scrollTop != scrollTo && elementId != undefined
      $('html, body').animate scrollTop: scrollTo,
        Math.abs(scrollTop - scrollTo) / 3


  # BACKGROUND SLIDESHOW

  $('#countdown').backstretch COUNTDOWN_BGNDS,
    duration: 3000
    fade: 750

  $('#about-you').backstretch ABOUT_YOU_BGNDS

  $('#about-us').backstretch ABOUT_US_BGNDS


  # COUNTDOWN!

  now = new Date()
  days = $(@).find('#days')
  hours = $(@).find('#hours')
  minutes = $(@).find('#minutes')
  seconds = $(@).find('#seconds')

  $('#countdown-timer').countdown DEBUT_DATE, (e) ->
    days.text(e.offset.totalDays)
    hours.text(e.offset.hours)
    minutes.text(e.offset.minutes)
    seconds.text(e.offset.seconds)


  # TESTIMONIALS

  testimonialText = $('.testimonial-single:first p').html()
  testimonialPara = $ '<p/>', testimonialText

  $('.testimonial-active').html testimonialPara
  $('.testimonial-single:first .testimonial-single-image img').css 'opacity', 1

  $('.testimonial-single-image img').on 'click', (e) ->
    $('.testimonial-single-image img').css 'opacity', 0.5
    $(@).css 'opacity', 1

    newTestimonialText = $(@)
      .parent('.testimonial-single-image')
      .siblings('p')
      .html

    $('.testimonial-active p').fadeOut 300, ->
      $(@).html newTestimonialText
      $(@).fadeIn 400



  # REGISTRATION FORM AJAX

  $('.success-message').hide()
  $('.error-message').hide()

  sendRegistration = (isStartup) ->
    data =
      "user":
        "email": $('#user_email').val()
        "is_startup": isStartup
      "authenticity_token": $('input[name=authenticity_token]').val()

    posting = $.ajax '/subscriptions',
      type: 'POST'
      data: JSON.stringify(data)
      dataType: 'json'
      contentType: 'application/json'

    posting.done (data) ->
      if data["valid"]
        $('#registration-form').hide()
        $('.registration.error-message').hide()
        $('.registration.success-message').hide()
        $('.registration.success-message').html data["message"]
        $('.registration.success-message').fadeIn()
      else
        $('#user_email').focus()
        $('.registration.success-message').hide()
        $('.registration.error-message').hide()
        $('.registration.error-message').html data["message"]
        $('.registration.error-message').fadeIn()

  $('#startup_submit').on 'click', (e) ->
    e.preventDefault()
    sendRegistration(true)

  $('#talent_submit').on 'click', (e) ->
    e.preventDefault()
    sendRegistration(false)



  # CONTACT FORM AJAX

  sendMessage = () ->
    data =
      "message":
        "email": $('#message_email').val()
        "subject": $('#message_subject').val()
        "body": $('#message_body').val()
      "authenticity_token": $('input[name=authenticity_token]').val()

    posting = $.ajax '/messages',
      type: 'POST'
      data: JSON.stringify(data)
      dataType: 'json'
      contentType: 'application/json'

    posting.done (data) ->
      if data["valid"]
        $('#contact-form').hide()
        $('.contact.error-message').hide()
        $('.contact.success-message').hide()
        $('.contact.success-message').html data["message"]
        $('.contact.success-message').fadeIn()
      else
        $('#message_email').focus()
        $('.contact.success-message').hide()
        $('.contact.error-message').hide()
        $('.contact.error-message').html data["message"]
        $('.contact.error-message').fadeIn()

  $('#contact-form').on 'submit', (e) ->
    e.preventDefault()
    sendMessage()

