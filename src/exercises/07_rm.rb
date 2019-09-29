# rm
@exercises << Exercise.new(
    'Unter den Teppich kehren',
    'Machen Sie sich mit der Funktionsweise von rm vertraut.',
    %Q{
      Sie sind sich klar geworden, dass man eine Speisekarte vielleicht doch nicht als .txt-Datei verwaltet und haben die Daten bereits in einer Datenbank gespeichert.

      Lösche Sie die Datei `speisekarte.txt` aus dem `#{PROJEKT_PATH}`-Verzeichnis.
    },
    :enter,
    'rm speisekarte.txt',
    -> () { !File.exists?("#{PATH}/speisekarte.txt") }
)
