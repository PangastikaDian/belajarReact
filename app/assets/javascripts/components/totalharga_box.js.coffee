@TotalHargaBox = React.createClass
  render: ->
    React.DOM.div
      className: 'card'
      React.DOM.div
        className: 'card-block'
        React.DOM.h2
          className: 'card-title text-xs-center'
          'Total Harga'
        React.DOM.h3
          className: 'card-text text-xs-center'
          @props.totalharga
