require! {
  react: {create-element}
  \react-dom : {render}
  \./containers/App.ls
}

render do
  create-element App
  document.get-element-by-id \app
