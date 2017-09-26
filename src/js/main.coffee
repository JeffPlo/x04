###*
  * Your JS/CoffeeScript goes here
  * Components like custom classes are in components/
  * Third party libraries are in vendor/ or /bower_components/
  *
  * For CoffeeScript style guide please refer to
  * https://github.com/MBV-Media/CoffeeScript-Style-Guide
  *
  * @since 1.0.0
  * @author R4c00n <marcel.kempf93@gmail.com>
  * @license MIT
###
'use strict'

jQuery ($) ->

  $window = $(window)
  $document = $(document)

  ###
    * Initialize modules/plugins/etc.
    *
    * @since 1.0.0
    * @return {void}
  ###
  init = ->
    $document.foundation()
    scrollToPage()
    return

  ###
    * Register listeners to all kind of events.
    *
    * @since 2.3.1
    * @return {void}
  ###
  registerEventListeners = ->
    $window.on 'load', onWindowLoad
    $document.on 'toggled.zf.responsiveToggle', '.responsive-menu-toggle',
        toggleBodyScrollBar
    $document.on 'click', '.page-scroll a', pageScroll
    $document.on 'click', '.no-touch .vc_tta-tab a, .no-touch .flex-control-nav a',
        setCustomSliderImage
    return

  ###
    * Logs a 'Website loaded.' info text.
    *
    * @since 2.3.1
    * @return {void}
  ###
  onWindowLoad = (event) ->
    setCustomSliderImage()
    return

  toggleBodyScrollBar = (event) ->
    $(@).toggleClass('active')
    $('body').toggleClass('overflow-hidden')
    $('#responsive-menu').toggleClass('active')

  pageScroll = (event) ->
    pageId = $(@).data( 'page-id' )
    target = $('.page-anchor-' + pageId)

    if target.length > 0
      event.preventDefault()
      hamburgerMenu = $('.responsive-menu-toggle')
      if hamburgerMenu.hasClass 'active'
        hamburgerMenu.find('button').trigger 'click'
      targetOffset = target.offset().top
      $('html,body').animate {scrollTop: targetOffset}, 1000

  scrollToPage = ->
    url = $(location).attr 'href'

    $( '.page-scroll.menu-item a').each ->
      element = $( this)
      menuUrl = element.attr 'href'

      if url == menuUrl
        setTimeout ->
          element.trigger 'click'
        , 1000

  setCustomSliderImage = ->
    image = $('.vc_active .flex-active-slide > img')
    $('.custom-slider-image').html image.clone()


  init()
  registerEventListeners()
