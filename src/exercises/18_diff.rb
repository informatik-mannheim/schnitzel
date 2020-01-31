# diff
@exercises << Exercise.new(
    'Find the difference',
    'Machen Sie sich mit der Funktionsweise von diff vertraut.',
    %Q{
      Sie suchen nach einem kleinen Unterschied zwischen zwei Dateien.

      Verwenden Sie `diff`, um den _Unterschied_ zwischen den beiden Dateien `kafka1.txt` und `kafka2.txt` im `chaos`-Ordner zu finden.
    },
    'Wie lautet der Unterschied?',
    'diff kafka1.txt kafka2.txt',
    -> () { read_console == "Informatik ist cool" }
)
