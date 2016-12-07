@Barang = React.createClass
  getInitialState: ->
    edit: false
    onerm: @props.barang.onerm
  handleToggle: (e) ->
    e.preventDefault()
    @setState edit: !@state.edit
  handleDelete: (e) ->
    e.preventDefault()
    $.ajax
      method: 'DELETE'
      url: "/barangs/#{ @props.barang.id }"
      dataType: 'JSON'
      success: () =>
        @props.handleDeleteBarang @props.barang
  handleEdit: (e) ->
    e.preventDefault()
    data =
      date: ReactDOM.findDOMNode(@refs.date).value
      namabarang: ReactDOM.findDOMNode(@refs.namabarang).value
      jumlah: ReactDOM.findDOMNode(@refs.jumlah).value
      harga: ReactDOM.findDOMNode(@refs.harga).value
      totalharga: @state.totalharga
    $.ajax
      method: 'PUT'
      url: "/barangs/#{ @props.barang.id }"
      dataType: 'JSON'
      data:
        barang: data
      success: (data) =>
        @setState edit: false
        @props.handleEditBarang @props.barang, data
  reCalculateTotalHarga: ->
    @setState totalharga: @getTotalHarga( ReactDOM.findDOMNode(@refs.jumlah).value, ReactDOM.findDOMNode(@refs.harga).value)
  getTotalHarga: (jumlah, harga) ->
    if jumlah and harga > 0 and jumlah < 11
      jumlah * harga
    else
      0
  barangRow: ->
    React.DOM.tr null,
      React.DOM.td null, @props.barang.date
      React.DOM.td null, @props.barang.namabarang
      React.DOM.td null, @props.barang.jumlah
      React.DOM.td null, @props.barang.harga
      React.DOM.td null, @props.barang.totalharga
      React.DOM.td null,
        React.DOM.button
          className: 'btn btn-primary'
          onClick: @handleToggle
          'Edit'
        React.DOM.button
          className: 'btn btn-danger'
          onClick: @handleDelete
          'Delete'
  barangForm: ->
    React.DOM.tr null,
      React.DOM.td null,
        React.DOM.input
          className: 'form-control'
          type: 'date'
          defaultValue: @props.barang.date
          ref: 'date'
      React.DOM.td null,
        React.DOM.input
          className: 'form-control'
          type: 'text'
          defaultValue: @props.barang.namabarang
          ref: 'namabarang'
      React.DOM.td null,
        React.DOM.input
          className: 'form-control'
          type: 'number'
          min: '1'
          max: '10'
          defaultValue: @props.barang.jumlah
          ref: 'jumlah'
          onChange: @reCalculateTotalHarga
      React.DOM.td null,
        React.DOM.input
          className: 'form-control'
          type: 'number'
          defaultValue: @props.barang.harga
          ref: 'harga'
          onChange: @reCalculateTotalHarga
      React.DOM.td null,
        @state.totalharga
      React.DOM.td null,
        React.DOM.button
          className: 'btn btn-primary'
          onClick: @handleEdit
          'Update'
        React.DOM.button
          className: 'btn btn-danger'
          onClick: @handleToggle
          'Cancel'
  render: ->
    if @state.edit
      @barangForm()
    else
      @barangRow()
