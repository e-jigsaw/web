require! {
  react: {Component, DOM}
}

class App extends Component
  on-click: ~>
    @refs.json.select!

  render: ->
    json = """
      {"title":"#{@props.title}","url":"#{@props.url}","description":"#{@props.description}","label":"#{@props.label}","createdAt":#{@props.created-at}}
    """
    DOM.div do
      {}
      DOM.p do
        {}
        DOM.input do
          on-change: (event)~>
            @props.dispatch 'descriptionChange', event
          placeholder: \description...
      DOM.p do
        {}
        DOM.input do
          on-change: (event)~>
            @props.dispatch 'labelChange', event
          placeholder: 'label(Comma splited)...'
      DOM.input do
        read-only: true
        ref: \json
        on-click: @on-click
        value: json
      DOM.button do
        on-click: ~> @props.dispatch 'open'
        \GO

module.exports = App
