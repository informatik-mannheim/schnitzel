# find / wc
@exercises << Exercise.new(
    'Find what you search for',
    'Mache Sie sich mit der Funktionsweise von find vertraut.',
    %Q{
      Sie wollen sich erstmal einen Überblick über Die wichtigsten Dokumente verschaffen, die alle als .txt-Dateien in "#{PROJEKT_PATH}/chaos" gespeichert sind.

      Finden Sie alle .txt-Dateien im "chaos"-Ordner (und den Unterordnern).
    },
    'Trage hier ein, wieviele .txt-Dateien im Ordner vorhanden sind:',
    'find chaos/ -name "*.txt" | wc',
    -> () { input.to_i == 32771 }
)

