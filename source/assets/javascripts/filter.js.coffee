$ ->
  $filter = $('#filter')
  $table = $('table[data-filter]')
  return unless $filter.length && $table.length

  prepare = (string) ->
    (string + '').trim().toLowerCase().replace(/[^a-z0-9\ ]/g, '')

  cellSelector = $table.attr('data-filter').split(' ').map((i) -> ":nth-child(#{i || 999})").join()
  typeSelector = ":nth-child(#{$table.attr('data-filter-type') || 999}) .label"

  $table.find('tbody tr').each ->
    $this = $(this)
    cells = $this.find(cellSelector).get()
    return unless cells.length

    data = [].slice.call(cells).map((cell) -> cell.innerText)
    type = switch prepare($this.find(typeSelector).text())
      when 'ex' then 'exercises'
      when 'le' then 'lecture'
      when 'la' then 'labs laboratories'
    data.unshift(type) if type

    $this.addClass('filter-by').attr('data-filter-by', prepare(data.join(' ')))
  $rows = $table.find('.filter-by')

  lastValue = null
  $filter.on 'input', ->
    $this = $(this)
    value = prepare($this.val())

    unless value is lastValue
      lastValue = value
      values = value.split(' ').map(prepare)
      $rows.removeClass('no-match')

      unless value
        $table.removeClass('table-filtered')
      else
        $table.addClass('table-filtered')
        $rows.each ->
          $this = $(this)
          data = $this.attr('data-filter-by')
          index = values.length

          while piece = values[--index]
            return $this.addClass('no-match') if data.indexOf(piece) < 0
