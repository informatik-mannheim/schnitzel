# less
@exercises << Exercise.new(
  'Der Preis eines Schnitzels',
  'Machen Sie sich mit der Funktionsweise von cd, ls, less und more vertraut.',
  %Q{
    Sie führen ein Schnitzelrestaurant und haben leider vergessen, was Sie für Ihre Gerichte verlangen.

    Zum Glück haben Sie die Speisekarte in der Datei `speisekarte.txt` im `#{PROJEKT_PATH}`-Ordner gespeichert.

    Schaue Sie in der Datei nach dem _Preis für ein Wiener-Schnitzel_.
  },
  'Welchen Preis hat das Wiener Schnitzel?',
  'less speisekarte.txt',
  -> () { input == "23,42" },
  -> () { File.write("#{PATH}/speisekarte.txt", "Wiener Schnitzel 23,42\nJägerschnitzel 28,44\nBauernschnitzel 24,13") }
)
