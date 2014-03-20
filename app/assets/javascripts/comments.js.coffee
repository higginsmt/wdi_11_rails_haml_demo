$ ->
  $('#new_comment').submit (event) ->
    event.preventDefault()
    console.log('clicked!')
    $.ajax(
      url: $('#new_comment').attr('action'),
      type: 'post'
      dataType: 'json',
      data:
        comment:
          body: $('#new_comment textarea').val()
    ).done (data)->
      if data.success
        $('p.notice').html('Saved!')
        console.log(data)
        $('#new_comment textarea').val('')
      else
        $('p.alert').html("#{data.errors.body[0]}!")
    .fail (data) ->
      console.log('fail!')


CoffeeApp = {}

CoffeeApp.renderComment = (comment) ->
  commentEl = $('<div>', class: 'comment')
  commentEl.append("<hr><p></p>")
