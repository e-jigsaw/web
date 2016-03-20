require! {
  react: {create-element}
  \react-micro-container : Container
  \../components/App.ls
}

class AppContainer extends Container.default
  (props)->
    super props
    @state =
      url: ''
      title: ''
      description: ''
      label: ''
      created-at: new Date!.get-time!

  description-handler: (event)~>
    @set-state do
      description: event.target.value

  label-handler: (event)~>
    @set-state do
      label: event.target.value

  open-handler: ->
    chrome.runtime.send-message cmd: \open

  component-did-mount: ->
    @subscribe do
      description-change: @description-handler
      label-change: @label-handler
      open: @open-handler
    tab <~ chrome.runtime.send-message cmd: \get
    @set-state do
      url: tab.0.url
      title: tab.0.title

  render: ->
    create-element do
      App
      dispatch: @dispatch
      url: @state.url
      title: @state.title
      description: @state.description
      label: @state.label
      created-at: @state.created-at

module.exports = AppContainer
