{View} = require 'atom'

module.exports =
class VibiusTemplatingView extends View
  @content: ->
    @div class: 'vibius-templating overlay from-top', =>
      @div "The VibiusTemplating package is Alive! It's ALIVE!", class: "message"

  initialize: (serializeState) ->
    atom.workspaceView.command "vibius-templating:toggle", => @toggle()

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @detach()

  toggle: ->
    console.log "VibiusTemplatingView was toggled!"
    if @hasParent()
      @detach()
    else
      atom.workspaceView.append(this)
