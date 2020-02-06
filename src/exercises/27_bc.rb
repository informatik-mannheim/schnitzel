# bc
@exercises << Exercise.new(
    'Kein unkalkuliertes Business!',
    'Machen Sie sich mit der Funktionsweise von "bc" vertraut.',
    %Q{
      Jetzt wo Sie wissen, wieviel Schnitzelrezepte Sie noch speichern können, fragen Sie sich, wieviele Schnitzel Sie auf dieser Insel verkaufen können.
      Kurzerhand entscheiden Sie sich mithilfe einer Bestechung an die Verkaufszahlen der Konkurrenz zu kommen.
      Nachdem Sie einen Finanzamtmitarbeiter mit einem Schnitzel bestochen haben, lässt dieser fallen, dass der Umsatz Ihres Konkurrenten etwa 3108 hoch 2000 beträgt.
      Da Sie dem Finanzamtmitarbeiter nicht trauen, beschließen Sie, diese Zahlen mit Ihrem Rechner auf Plausibilität zu prüfen.

      Benutzen Sie das Kommando `bc`, um herauszufinden, wieviel 3108 hoch 2000 beträgt.
    },
    'Geben Sie hier die letzte Zeile des Ergebnisses an:',
    'echo "3108^2000" | bc',
    -> () { read_console == '9443143978953998187590546511579035962672599269376' }
)

