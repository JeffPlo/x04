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
    $document.on 'click', '.vc_tta-tab a, .flex-control-nav a',
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
    event.preventDefault()
    #anchor = $(@).parent().attr('id').replace( 'page-item-', '')
    #target = $('.page-anchor-' + anchor)

    console.log( $(@).parent().attr('class') )
    #if target.length > 0
    #  targetOffset = target.offset().top
    #  $('html,body').animate {scrollTop: targetOffset}, 1000

  setCustomSliderImage = ->
    $('.custom-slider-image').html $('.vc_active .flex-active-slide img')
      .clone()


  init()
  registerEventListeners()
