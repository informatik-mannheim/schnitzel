# rm -rf
@exercises << Exercise.new(
    'Ist das Kunst, oder kann das weg?',
    'Frischen Sie Ihr Wissen zu rm ein wenig auf.',
    %Q{
      Die Steuerfahndung ist Ihnen auf der Spur und Ihnen wird die Sache zu heiß. Sie entscheiden sich, alle Dokumente, die Sie mit zwielichtigen Geschäften in Verbindung bringen könnten zu löschen.

      Löschen Sie den Ordner "nothing-to-see-here", zusammen mit seinem Inhalt.
    },
    :enter,
    'rm -rf nothing-to-see-here',
    -> () { !File.exists?("#{PATH}/nothing-to-see-here") }
)
