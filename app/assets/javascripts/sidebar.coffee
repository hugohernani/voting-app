class Sidebar
  constructor: ->
    $('#sidebar').mCustomScrollbar theme: 'minimal'
    $('#sidebarCollapse').on 'click', ->
      $('#sidebar, #content').toggleClass 'active'
      $('.collapse.in').toggleClass 'in'
      $('a[aria-expanded=true]').attr 'aria-expanded', 'false'

$ ->
  new Sidebar
