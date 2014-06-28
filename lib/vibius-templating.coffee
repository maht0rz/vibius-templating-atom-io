VibiusTemplatingView = require './vibius-templating-view'

module.exports =
  vibiusTemplatingView: null

  activate: (state) ->
    @vibiusTemplatingView = new VibiusTemplatingView(state.vibiusTemplatingViewState)

  deactivate: ->
    @vibiusTemplatingView.destroy()

  serialize: ->
    vibiusTemplatingViewState: @vibiusTemplatingView.serialize()
