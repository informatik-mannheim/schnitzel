# man
@exercises << Exercise.new(
    'Hilfe',
    'Lernen Sie, sich die Hilfe von Programmen anzeigen zu lassen.',
    %Q{
      Sie möchten mehr über ein Linux-Kommando erfahren. Dies erfolgt bei den meisten Kommandos über den Befehl `man`. Bei manchen Kommandos kann man auch als Option `--help` angeben.

      Geben Sie `man ls` ein und finden Sie heraus, mit welcher Option von `ls` man die Einträge nach dem _Datum der letzen Veränderung_ sortieren kann. (Man kann die Anzeige von `man` mit `Q` verlassen und mit `/` darin suchen.)
    },
    'Wie lautet das gesuchte Kommando (inklusive ls)?',
    'ls -t',
    -> () { read_console == 'ls -t' }
)
