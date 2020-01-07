# vi / nano
@exercises << Exercise.new(
  'Erstkontakt',
  'Lernen Sie in Verzeichnisse zu wechseln (cd) und Dateien zu editieren (vi / nano).',
  %Q{
    Sie möchten eine Datei mit Ihrem Lieblingsfilm anlegen - der übrigens "_Pulp Fiction_" heißt.

    Das Verzeichnis `#{PROJEKT_PATH}` ist das Grundverzeichnis dieser Schnitzeljagd, Sie finden es immer als Unterordner des Verzeichnisses `#{BASE_PATH}`.

    Gehen Sie in das Verzeichnis `#{PROJEKT_PATH}` und legen Sie dort eine Datei mit dem Namen `film.txt` an, in die Sie "Pulp Fiction" schreiben. Verwenden Sie hierzu entweder den _Editor_ `vi` oder `nano`.
},
  :enter,
  'cd ; cd linux-kurs ; echo "Pulp Fiction" > film.txt',
  -> () { f = "#{PATH}/film.txt"; File.exists?(f) && File.read(f).strip == "Pulp Fiction" },
  -> () { create_workdir }
)
