# tar
CHAOS_FILE_COUNT = 66890

@exercises << Exercise.new(
    'Archive',
    'Machen Sie sich mit der Funktionsweise von tar vertraut.',
    %Q{
      Die Dokumente wurden in einem Archiv gespeichert, um sie kompakt und gebündelt zu verwalten.

      _Entpacken_ Sie das heruntergeladene Archiv in den Ordner `#{PROJEKT_PATH}`.
    },
    :enter,
    'tar -xJf chaos.tar.xz',
    -> () { Dir.exist?("#{PATH}/chaos") && Dir["#{PATH}/chaos/**/*"].count == CHAOS_FILE_COUNT }
)
