# wget or curl
CHAOS_SIZE = 2405800

@exercises << Exercise.new(
    'Ein neues Kapitel',
    'Machen Sie sich mit der Funktionsweise von wget oder curl vertraut.',
    %Q{
      Sie haben sich auf eine karibische Insel abgesetzt und wollen dort mit einem Schnitzelrestaurant wieder neu anfangen, diesmal aber ohne zwielichtige Geschäftspraktiken. Noch in Deutschland haben Sie wichtige Dokumente archiviert und online gestellt.

      Laden Sie die Datei unter: `#{CHAOS_URL}`

      ...in das `#{PROJEKT_PATH}`-Verzeichnis herunter.
    },
    :enter,
    "wget #{CHAOS_URL} or curl -ON #{CHAOS_URL}",
    -> () { File.exists?("#{PATH}/chaos.tar.xz") && File.size("#{PATH}/chaos.tar.xz") == CHAOS_SIZE }
)
