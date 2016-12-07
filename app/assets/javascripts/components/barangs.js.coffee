@Barangs = React.createClass
  getInitialState: ->
    barangs: @props.data
  getDefaultProps: ->
    barangs: []
  addBarang: (barang) ->
    barangs = @state.barangs.slice()
    barangs.push barang
    @setState barangs: barangs
  deleteBarang: (barang) ->
    barangs = @state.barangs.slice()
    index = barangs.indexOf barang
    barangs.splice index, 1
    @replaceState barangs: barangs
  updateBarang: (barang, data) ->
    index = @state.barangs.indexOf barang
    barangs = React.addons.update(@state.barangs, { $splice: [[index, 1, date]] })
    @replaceState barangs: barangs
  render: ->
    React.DOM.div
      className: 'barangs'
      React.DOM.h1
        className: 'title'
        'Data Barang'
       React.createElement BarangForm, handleNewBarang: @addBarang
       React.DOM.table
        className: 'table table-bordered'
        React.DOM.thead null,
          React.DOM.tr null,
            React.DOM.th null, 'Date'
            React.DOM.th null, 'Nama Barang'
            React.DOM.th null, 'Jumlah'
            React.DOM.th null, 'Harga'
            React.DOM.th null, 'Total Harga'
            React.DOM.th null, 'Actions'
        React.DOM.tbody null,
          for barang in @state.barangs
            React.createElement Barang, key: barang.id, barang: barang, handleDeleteBarang: @deleteBarang, handleEditBarang: @updateBarang
