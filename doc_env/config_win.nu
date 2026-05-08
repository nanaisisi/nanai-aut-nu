
$env.config.buffer_editor = "hx"
$env.config.edit_mode = 'vi'
$env.config.rm.always_trash = true
$env.config.history = {
  file_format: sqlite
  max_size: 5_000_000
  sync_on_enter: true
  isolation: true
}
$env.COLORTERM = "truecolor"

# key bindings
$env.config.keybindings ++= [
  {
     name: history_hint_complete
     modifier: control
     keycode: char_j
     mode: vi_insert
     event: [
       { send: HistoryHintComplete }
    ]
  }
 ]
mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")
