# vi / nano
@exercises << Exercise.new(
  'Datei editieren',
  'Eine vorhandene Datei mit einem Editor bearbeiten.',
  %Q{
    Sie möchten eine Datei mit Lieblingsfilmen von jemand anderem editieren.

    Gehen Sie in das Verzeichnis `#{PROJEKT_PATH}` und editieren Sie die Datei `prof-filme.txt`, die dort liegt. Entfernen Sie den Film "Blade Runner", den Sie (unverständlicherweise) persönlich nicht mögen.
  },
  :enter,
  'vi prof-filme.txt; J DD :w :q',
  -> () { File.read("#{PATH}/prof-filme.txt").strip == "Pulp Fiction\nAlien\nFight Club" },
  -> () { create_workdir; File.write("#{PATH}/prof-filme.txt", "Pulp Fiction\nBlade Runner\nAlien\nFight Club\n") }
)
