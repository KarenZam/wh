$ ->

  DEBUT_DATE = "2014/4/4"

  COUNTDOWN_BGNDS = [
    "assets/backgrounds/free_blue_sky.jpg"
    "assets/backgrounds/free_computer_2pers.jpg"
    "assets/backgrounds/free_laptop_wood.jpg"
  ]

  ABOUT_YOU_BGNDS = "assets/backgrounds/blurred_path.jpg"

  ABOUT_US_BGNDS = "assets/backgrounds/free_redbricks.jpg"

  # GO TO REGISTER

  goToRegister = () ->
    elementId = "#subscribe"
    scrollTop = $(window).scrollTop()
    scrollTo = $(elementId).offset().top
    navHeight = $('header[role=banner] nav').height()

    if scrollTop != scrollTo && elementId != undefined
      $('html, body').animate scrollTop: scrollTo,
        Math.abs(scrollTop - scrollTo)
    $('#subscriber-email').focus()

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

  $('#countdown-arrow').on 'click', (e) ->
    e.preventDefault()

    goToRegister()

  $('header[role=banner] nav a').on 'click', (e) ->
    e.preventDefault()

    elementId = $(@).attr('class').replace /menu-/, "#"
    scrollTop = $(window).scrollTop()
    scrollTo = $(elementId).offset().top
    navHeight = $('header[role=banner] nav').height()

    if scrollTop != scrollTo && elementId != undefined
      $('html, body').animate scrollTop: scrollTo,
        Math.abs(scrollTop - scrollTo) / 3

    if elementId == "#subscribe"
      $('#subscriber-email').focus()
    if elementId == "#contact-us"
      $('#contact-email').focus()

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



  # ABOUT YOU

  $('#about-you').find('header').on 'click', (e) ->
    e.preventDefault()
    goToRegister()

  $('#about-you').find('li:last-child').on 'click', (e) ->
    e.preventDefault()
    goToRegister()

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

  sendSubcription = ->
    email = $('#subscriber-email').val()
    message = "Thank you, #{email}. We'll be in touch."

    data =
      "subscriber":
        "email": email
      "authenticity_token": $('input[name=authenticity_token]').val()

    $('#subscription-form').hide()
    $('.subscription.error-message').hide()
    $('.subscription.success-message').hide()
    $('.subscription.success-message').html message
    $('.subscription.success-message').fadeIn()

    posting = $.ajax '/subscriptions',
      type: 'POST'
      data: JSON.stringify(data)
      dataType: 'json'
      contentType: 'application/json'

    posting.done (data) ->
      unless data["valid"]
        $('#subscriber-email').focus()
        $('.subscription.success-message').hide()
        $('.subscription.error-message').hide()
        $('.subscription.error-message').html data["message"]
        $('.subscription.error-message').fadeIn()


  $('#subscription-form').on 'submit', (e) ->
    e.preventDefault()
    sendSubcription()



  # CONTACT FORM AJAX

  sendMessage = () ->
    email = $('#contact-email').val()
    subject = $('#contact-subject').val()
    message = $('#contact-message').val()

    data =
      "contact":
        "email": email
        "subject": subject
        "message": message
      "authenticity_token": $('input[name=authenticity_token]').val()

    $('#contact-form').hide()
    $('.contact.error-message').hide()
    $('.contact.success-message').hide()
    $('.contact.success-message').html("Thank you, #{email}. We&apos;ll be in touch.")
    $('.contact.success-message').fadeIn()

    posting = $.ajax '/contacts',
      type: 'POST'
      data: JSON.stringify(data)
      dataType: 'json'
      contentType: 'application/json'

    posting.done (data) ->
      unless data["valid"]
        $('#contact_email').focus()
        $('.contact.success-message').hide()
        $('.contact.error-message').hide()
        $('.contact.error-message').html data["message"]
        $('.contact.error-message').fadeIn()

  $('#contact-form').on 'submit', (e) ->
    e.preventDefault()
    sendMessage()

