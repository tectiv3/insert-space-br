{CompositeDisposable} = require 'atom'

module.exports = InsertBr =
  subscriptions: null

  activate: (state) ->
    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-text-editor', 'insert-space-br:insertbr': => @insertbr()
    @subscriptions.add atom.commands.add 'atom-text-editor', 'insert-space-br:insertnbsp': => @insertnbsp()

  deactivate: ->
    @subscriptions.dispose()

  insertbr: ->
    editor = atom.workspace.getActiveTextEditor()
    editor?.insertText('<br/>')

  insertnbsp: ->
    editor = atom.workspace.getActiveTextEditor()
    editor?.insertText('&nbsp;')