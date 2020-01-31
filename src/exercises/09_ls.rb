# ls -axl
@exercises << Exercise.new(
    'Wem gehört denn das?',
    'Vertiefen Sie Ihr Wissen zu ls.',
    %Q{
      Sie verwalten Dateien zu zwielichtigen Geschäften im Ordner `shady-business` im `#{PROJEKT_PATH}`-Verzeichnis.

      Finden Sie heraus, welcher Benutzer der _Besitzer des Ordners_ `shady-business` ist.
    },
    'Trage Sie hier den Namen des Besitzers ein:',
    'ls -axl',
    -> () { read_console == ENV['USER'] },
    -> () { mkdir("#{PATH}/shady-business", 0700) }
)
