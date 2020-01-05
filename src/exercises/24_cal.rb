# cal
@exercises << Exercise.new(
    'Sag niemals nie.',
    'Machen Sie sich mit der Funktionsweise "cal" vertraut.',
    %Q{
      An der Strandbar lernen Sie einen Ureinwohner der karibischen Insel kennen, der Ihnen eine Location für Ihr neues Schnitzelresturant vermieten könnte. Dieser behauptet, dass das Haus von seinen Vorfahren im kürzesten Monat des Jahres 1752 erbaut worden sei.
      Als der Ureinwohner den Monat nennt, brechen Sie in Lachen aus: "Das war noch nie der kürzeste Monat eines Jahres!"
      Zum Beweis lassen Sie sich mithilfe des Befehles `cal` den Überblick des Jahres 1752 anzeigen.

     Finden Sie mithilfe der _Jahresübersicht des Befehls `cal`_ heraus, welcher Monat in dem Jahr 1752 der kürzeste Monat war und zählen Sie, wiviele einzelne Tage dieser laut `cal` hatte.
    },
    'Wie viele einzelne Tage hatte der kürzeste Monat des Jahres 1752 laut cal?',
    'cal 1752',
    -> () { input == '19' }
)
