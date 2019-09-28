# chmod
@exercises << Exercise.new(
    'Read, Write and Execute',
    'Machen Sie sich mit der Funktionsweise von chmod vertraut.',
    %Q{
      Ihre Geschäftspartner brauchen Zugang zu den zwielichtigen Dokumenten.

      Änderen Sie die Zugriffsrechte des "nothing-to-see-here"-Ordners so um, dass jeder Benutzer darin Lesen, Schreiben und Ausführen kann.
    },
    :enter,
    'sudo chmod og+rwx nothing-to-see-here',
    -> () { p = `#{STAT_PERMISSIONS} #{PATH}/nothing-to-see-here`.strip; p == '777' || p == '707' }
)
