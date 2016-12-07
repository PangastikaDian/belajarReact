@BarangForm = React.createClass
  getInitialState: ->
    date: ''
    namabarang: ''
    jumlah: ''
    harga: ''
    totalharga: '0'
  handleValueChange: (e) ->
    valueName = e.target.name
    @setState "#{ valueName }": e.target.value
  calculateTotalHarga: ->
    if @state.jumlah and @state.harga
        @state.totalharga = @state.jumlah * @state.harga
    else
      0
  valid: ->
    @state.date && @state.namabarang && @state.jumlah && @state.harga && @state.totalharga
  handleSubmit: (e) ->
    e.preventDefault()
    $.post '', { barang: @state }, (data) =>
      @props.handleNewBarang data
      @setState @getInitialState()
    , 'JSON'
  render: ->
    React.DOM.form
      className: 'form-inline'
      onSubmit: @handleSubmit
      React.DOM.div
        className: 'form-group'
        React.DOM.input
          type: 'date'
          className: 'form-control'
          placeholder: 'date'
          name: 'date'
          value: @state.date
          onChange: @handleValueChange
      React.DOM.div
        className: 'form-group'
        React.DOM.input
          type: 'text'
          className: 'form-control'
          placeholder: 'namabarang'
          name: 'namabarang'
          value: @state.namabarang
          onChange: @handleValueChange
      React.DOM.div
        className: 'form-group'
        React.DOM.input
          type: 'number'
          min: 1
          max: 10
          className: 'form-control'
          placeholder: 'jumlah'
          name: 'jumlah'
          value: @state.jumlah
          onChange: @handleValueChange
      React.DOM.div
        className: 'form-group'
        React.DOM.input
          type: 'number'
          className: 'form-control'
          placeholder: 'harga'
          name: 'harga'
          value: @state.harga
          onChange: @handleValueChange
      React.DOM.button
        type: 'submit'
        className: 'btn btn-primary'
        disabled: !@valid()
        'Create Barang'
      React.createElement TotalHargaBox, totalharga: @calculateTotalHarga()
