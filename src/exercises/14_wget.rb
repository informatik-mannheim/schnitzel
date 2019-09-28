# wget
@exercises << Exercise.new(
    'Ein neues Kapitel',
    'Mache Sie sich mit der Funktionsweise von wget vertraut.',
    %Q{
      Sie haben sich auf eine karibische Insel abgesetzt und wollen dort mit einem Schnitzelrestaurant wieder neu anfangen, diesmal aber ohne zwielichtige Geschäftspraktiken. Noch in Deutschland haben Sie wichtige Dokumente archiviert und online gestellt.

      Laden Sie die Ressource unter: #{CHAOS_URL}

      ...in das "#{PROJEKT_PATH}"-Verzeichnis herunter.
    },
    :enter,
    "wget #{CHAOS_URL}",
    -> () { File.exists?("#{PATH}/chaos.tar.xz") && File.size("#{PATH}/chaos.tar.xz") == 5454500 }
)
