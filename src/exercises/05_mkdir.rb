# mkdir / cp
@exercises << Exercise.new(
  'Life, Death & Taxes',
  'Machen Sie sich mit der Funktionsweise von mkdir und cp vertraut.',
  %Q{
    Der Steuerberater Ihres Restaurants braucht ein paar Unterlagen von Ihnen.

    Erstelle für ihn einen Ordner `tax-man` im `#{PROJEKT_PATH}`-Verzeichnis.

    Kopieren Sie die Datei `speisekarte.txt` aus dem `#{PROJEKT_PATH}`-Verzeichnis in das `tax-man` Verzeichnis.
   },
   :enter,
   'mkdir tax-man; cp speisekarte.txt tax-man/',
  -> () { File.exists?("#{PATH}/tax-man/speisekarte.txt") && File.read("#{PATH}/speisekarte.txt") == File.read("#{PATH}/tax-man/speisekarte.txt") }
)
