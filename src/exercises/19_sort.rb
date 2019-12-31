# sort / uniq / > / |
@exercises << Exercise.new(
    'Sortieren und ordnen',
    'Machen Sie sich mit der Funktionsweise von sort, uniq und der Ausgabeumleitung (<,>,|) vertraut.',
    %Q{
      Im Ordner `chaos` befindet sich eine Wortliste in der Datei `wortliste.txt`, die jedoch beim Transport heftig durcheinander geraten ist. Außerdem sind noch einige Worte mehrfach vorhanden.

      Verwenden Sie `sort` und `uniq`, um die Liste zu sortieren und Doubletten zu entfernen. Speichern Sie das Ergebnis in der Datei `wortliste_sortiert.txt` _direkt im Ordner `#{PROJEKT_PATH}`_.
    },
    :enter,
    'cd chaos; sort wortliste.txt | uniq > ../wortliste_sortiert.txt',
    -> () { f = "#{PATH}/wortliste_sortiert.txt"; File.exists?(f) && (File.readlines(f)[142].strip == 'ausbauchen' || File.readlines(f)[142].strip == 'Behelfsverkaufsstelle') }
)
