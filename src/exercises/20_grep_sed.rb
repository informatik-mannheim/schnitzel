# grep / sed / | / >
@exercises << Exercise.new(
    'Monnheim',
    'Machen Sie sich mit der Funktionsweise von grep, sed und der Ausgabeumleitung (<,>,|) vertraut.',
    %Q{
      Sie wollen aus der sortierten Wortliste einige Wörter mit "grep" heraussuchen und diese dann mit "sed" verändern.

      Finden Sie alle Wörter in der Liste "wortliste_sortiert.txt", in denen die Buchstabenfolge "heim" vorkommt. Ersetzen Sie diese Buchstaben durch "mannheim" und schreiben Sie das Ergebnis in eine neue Datei "monnheim.txt" im Ordner "#{PROJEKT_PATH}".
    },
    :enter,
    'grep heim wortliste_sortiert.txt | sed -e "s/heim/mannheim/g" > monnheim.txt',
    -> () { f = "#{PATH}/monnheim.txt"; File.exists?(f) && File.readlines(f).map(&:chomp) == [ 'Billigmannheim', 'Blindenmannheim', 'Gemannheimkonto', 'Saisonmannheimspiel', 'Sportlermannheim' ] }
)
