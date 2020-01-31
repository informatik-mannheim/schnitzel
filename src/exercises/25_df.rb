# df
@exercises << Exercise.new(
    'Man kann nie genug Platz haben.',
    'Machen Sie sich mit der Funktionsweise von "df" vertraut.',
    %Q{
      Ihr Schnitzelrestaurant läuft super und es fallen immer mehr Daten an, die Sie speichern müssen, z.B. Schnitzelrezepte aus aller Welt. Langsam machen Sie sich Sorgen, ob der Platz auf Ihrer Festplatte für diese Datenmengen ausreicht.

      Benutzen Sie das Kommando `df`, um herauszufinden, wie viel Platz noch auf Ihrer Root-Partition (`/`) ist.
    },
    'Wie viel Platz haben Sie (in Gigabyte)?',
    'df /',
    -> (os) do
       if os == :linux
         input == `df -P -B G /`.split(/\b/)[28].to_i.to_s
       elsif os == :macos
         input == `df -P -g /`.split(/\b/)[24].to_i.to_s
       end
    end
)
