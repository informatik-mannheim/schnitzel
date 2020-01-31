# df
@exercises << Exercise.new(
    'Man kann nie genug Platz haben.',
    'Machen Sie sich mit der Funktionsweise von "df" vertraut.',
    %Q{
      Ihr Schnitzelrestaurant läuft super und es fallen immer mehr Daten an, die Sie speichern müssen, z.B. Schnitzelrezepte aus aller Welt. Langsam machen Sie sich Sorgen, ob der Platz auf Ihrer Festplatte für diese Datenmengen ausreicht.

      Benutzen Sie das Kommando `df`, um herauszufinden, wie viel Platz noch auf Ihrer Root-Partition (`/`) ist.
    },
    'Wie viel Platz haben Sie (in Gigabyte)?',
    'df -P -B G /',
    -> (os) do
       # Way to determine free space is really hacky but we would like
       # to avoid pulling additional gems like sys/filesystem or similar
       input_i == if os == :linux
         `df -P -B G /`.split(/\b/)[28].to_i
       elsif os == :macos
         `df -P -g /`.split(/\b/)[24].to_i
       end
    end
)
