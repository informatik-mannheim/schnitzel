# whoami
@exercises << Exercise.new(
    'Wer bin ich?',
    'Mache Sie sich mit der Funktionsweise von whoami vertraut.',
    %Q{
      Finde Sie heraus, als welcher Benutzer Sie im System angemeldet sind.
    },
    'Tragen Sie hier ein, wie Ihr Benutzer heißt:',
    'whoami',
    -> () { input == ENV['USER'] }
)
