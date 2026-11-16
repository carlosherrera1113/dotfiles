-- ~/.tmux.conf:20 `bind C-a send-prefix`
rex.bind("ctrl+a>ctrl+a", "pane.send_key", { key = "ctrl+a" })
