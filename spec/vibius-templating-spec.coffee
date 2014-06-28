{WorkspaceView} = require 'atom'
VibiusTemplating = require '../lib/vibius-templating'

# Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
#
# To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# or `fdescribe`). Remove the `f` to unfocus the block.

describe "VibiusTemplating", ->
  activationPromise = null

  beforeEach ->
    atom.workspaceView = new WorkspaceView
    activationPromise = atom.packages.activatePackage('vibius-templating')

  describe "when the vibius-templating:toggle event is triggered", ->
    it "attaches and then detaches the view", ->
      expect(atom.workspaceView.find('.vibius-templating')).not.toExist()

      # This is an activation event, triggering it will cause the package to be
      # activated.
      atom.workspaceView.trigger 'vibius-templating:toggle'

      waitsForPromise ->
        activationPromise

      runs ->
        expect(atom.workspaceView.find('.vibius-templating')).toExist()
        atom.workspaceView.trigger 'vibius-templating:toggle'
        expect(atom.workspaceView.find('.vibius-templating')).not.toExist()
