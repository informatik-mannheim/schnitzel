# df
@exercises << Exercise.new(
    'Es kommt doch auf die Größe an.',
    'Machen Sie sich mit der Funktionsweise von "du" vertraut.',
    %Q{
      Nachdem Sie jetzt wissen, dass Sie auf Ihrer Festplatte noch etwas Platz für Ihre Schnitzelrezepte haben, stellt sich die Frage, wie groß die Rezepte jetzt schon sind.

      Benutzen Sie das Kommando `du`, um herauszufinden, wie viel Platz alle Dateien im Ordner `#{PROJEKT_PATH}/chaos` zusammen verbrauchen.
    },
    'Wie viel Platz (in Megabyte) verbraucht der Ordner chaos?',
    "du -h #{PROJEKT_PATH}/chaos",
    -> (os) do
       # Way to determine used space is really hacky but we would like
       # to avoid pulling additional gems like sys/filesystem or similar
       input_i == if os == :linux
         `du -d0 -P -B M #{PATH}/chaos`.split(/\b/)[0].to_i
       elsif os == :macos
         `du -P -d0 -m #{PATH}/chaos`.split(/\b/)[0].to_i
       end
    end
)
