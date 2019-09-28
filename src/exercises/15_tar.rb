# tar
@exercises << Exercise.new(
    'Archive',
    'Machen Sie sich mit der Funktionsweise von tar vertraut.',
    %Q{
      Die Dokumente wurden in einem Archiv gespeichert, um sie kompakt und gebündelt zu verwalten.

      Entpacken Sie das heruntergeladene Archiv in den Ordner "#{PROJEKT_PATH}".
    },
    :enter,
    'tar -xJf chaos.tar.xz',
    -> () { Dir.exists?("#{PATH}/chaos") && Dir["#{PATH}/chaos/**/*"].count == 65538 }
)
