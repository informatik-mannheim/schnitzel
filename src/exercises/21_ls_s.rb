# ln -s
@exercises << Exercise.new(
    'Was heißt hier Softie?',
    'Machen Sie sich mit der Funktionsweise von Hard- und Softlinks und dem Kommando "ln" vertraut.',
    %Q{
      Im Ordner `#{PROJEKT_PATH}` finden Sie eine Datei namens `highlander.txt`. Erstellen Sie einen Softlink (symbolischer Link) namens `macleod.txt` auf diese Datei.
    },
    :enter,
    'ln -s highlander.txt macleod.txt',
    -> () { f = "#{PATH}/macleod.txt"; File.exists?(f) && File.symlink?(f) },
    -> () { f = "#{PATH}/highlander.txt"; File.write(f, "Es kann nur einen geben!\n\n") unless File.exists?(f) }
)
