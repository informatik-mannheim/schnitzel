# chmod
@exercises << Exercise.new(
    'Read, Write and Execute',
    'Machen Sie sich mit der Funktionsweise von chmod vertraut.',
    %Q{
      Ihre Geschäftspartner brauchen Zugang zu den zwielichtigen Dokumenten.

      _Änderen_ Sie die _Zugriffsrechte_ des `nothing-to-see-here`-Ordners so um, dass jeder Benutzer darin lesen, schreiben und ausführen kann.
    },
    :enter,
    'sudo chmod og+rwx nothing-to-see-here',
    -> (os) do
      if os == :linux
        p = `stat -c %a #{PATH}/nothing-to-see-here`.strip
      elsif os == :macos
        p = `stat -f %Lp #{PATH}/nothing-to-see-here`.strip
      end

      p == '777' || p == '707'
    end
)
