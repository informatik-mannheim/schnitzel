# ps / kill
@exercises << Exercise.new(
    'Vertrauen ist nichts, Kontrolle ist alles',
    'Machen Sie sich mit der Funktionsweise "ps" und "kill" vertraut.',
    %Q{
      Auf Ihrem System läut ein Prozess mit dem Namen `"sleep"`, der Ihrem Benutzer gehört. Finden Sie ihn und _beenden Sie den Prozess_. Möglicherweise laufen auch mehrere Prozesse, dann beenden Sie alle mit dem Namen `"sleep"` und Ihrem Benutzernamen.
    },
    :enter,
    'ps aux | grep sleep ; kill PID',
    -> () { `ps aux | grep sleep | grep $USER | grep -v "grep"`.strip == "" },
    -> () { p = fork { exec "sleep 100000" }; Process.detach(p) }
)
