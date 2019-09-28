# grep
@exercises << Exercise.new(
    'Find the key',
    'Machen Sie sich mit der Funktionsweise von grep vertraut.',
    %Q{
      Sie suchen nach einem wichtigen Passwort, wissen aber nicht mehr wo es steht.

      Sie wissen nur, dass es irgendwo in einer Datei im "chaos"-Ordner gespeichert ist und sowohl mit einem "#" anfängt, als auch aufhört.

      Navigieren Sie in den Ordner "#{PROJEKT_PATH}/chaos".

      Nutzen Sie grep, um das Passwort zu finden. (Tipp: der richige reguläre Ausdruck ist "#.*#").
    },
    'Wie lautet das magische Passwort (ohne die #)?',
    'grep -roh "#.*#"',
    -> () { input == "parmigiana4life" }
)
