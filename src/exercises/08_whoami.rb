# whoami
@exercises << Exercise.new(
    'Wer bin ich?',
    'Machen Sie sich mit der Funktionsweise von whoami vertraut.',
    %Q{
      Finde Sie heraus, als _welcher Benutzer_ Sie im System angemeldet sind.
    },
    'Tragen Sie hier ein, wie Ihr Benutzer heißt:',
    'whoami',
    -> () { read_console == ENV['USER'] }
)
