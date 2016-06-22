newUrl = (url, date, projectPath) ->
  [base, params] = url.split('?')
  pageParam = params.match(/page=\d+/)[0]
  base + '?' + pageParam + '&date=' + date + '&project_path=' + projectPath

$ ->
  if $('.pagination').length
    $(window).scroll ->
      url = $('.pagination .next a').attr('href')
      date = $('.events-date').last().data('date')
      projectPath = $('.events-project').last().data('projectPath')
      if url && $(window).scrollTop() > $(document).height() - $(window).height() - 50
        $('.pagination').text("Fetching more products...")
        $.getScript(newUrl(url, date, projectPath))
    $(window).scroll()
