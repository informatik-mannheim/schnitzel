# ------------
# Constants
# ------------

# Width of the terminal
LINE_WIDTH = 80

# Base path to all our files (User's home)
BASE_PATH = "#{Dir.home}"

# Our directory (without base path)
PROJEKT_PATH = "linux-kurs"

# Full Path
PATH = "#{BASE_PATH}/#{PROJEKT_PATH}"

# File to log the progress
LOG_FILE = "#{PATH}/.schnitzel.log"

# Text ot ask for <ENTER>
ENTER_TEXT = "Drücken Sie <ENTER>, um die Lösung zu überprüfen:"

# Wrong solution
WRONG_SOLUTION = "Leider falsch. Probieren Sie es noch einmal."

# Motivation phrases for wrong solutios
WRONG_SOLUTION_MOTIVATION = ["Es ist noch kein Meister vom Himmel gefallen!", "Bitte geben Sie nicht auf!", "Sie können Ihre Zukunft verändern mit dem was Sie heute tun!", "Wer die Linux Console lernt, macht Fehler. Wer viel von der Linux Console lernt, macht mehr Fehler. Nur wer die Hände in den Schoß statt auf die Tastatur legt, macht gar keine Fehler.", "Selbst der schlimmste Fehler ist nicht so schlimm, wie es nie versucht zu haben! Weiter versuchen!"]

# Correct solution
CORRECT_SOLUTION = "Korrekt."

# Prais phrases for correct solutions
CORRECT_SOLUTION_PRAISES = ["Gut gemacht!", "Großartig!", "Außerordentlich gut!", "Weiter so!", "Sehr gut gemacht!", "Prima!", "Super Leistung!", "Top Leistung!", "Top!", "Wunderbar!", "Toll!", "Spitze!", "Wundervoll!", "Herausragend!", "Hervorragend!", "Toll gemacht!", "Super!" , "Einsame Spitze!", "Grandios!", "Bravo!",  "Sensationell!", "Weiter so!", "Meisterhaft!", "Spitzenmäßig!", "Stark!", "Klasse gemacht!", "Astrein!"]

# Location of the prepared tar
CHAOS_URL = "https://github.com/informatik-mannheim/schnitzel/raw/master/chaos.tar.xz"

# Message shown if all exercises were done
WINNER_MESSAGE = %q{
 _    _  _                             _    _  _
| |  | |(_)                           | |  | |(_)
| |  | | _  _ __   _ __    ___  _ __  | |  | | _  _ __   _ __    ___  _ __
| |/\| || || '_ \ | '_ \  / _ \| '__| | |/\| || || '_ \ | '_ \  / _ \| '__|
\  /\  /| || | | || | | ||  __/| |    \  /\  /| || | | || | | ||  __/| |
 \/  \/ |_||_| |_||_| |_| \___||_|     \/  \/ |_||_| |_||_| |_| \___||_|

 _____  _      _        _                 ______  _
/  __ \| |    (_)      | |                |  _  \(_)
| /  \/| |__   _   ___ | | __ ___  _ __   | | | | _  _ __   _ __    ___  _ __
| |    | '_ \ | | / __|| |/ // _ \| '_ \  | | | || || '_ \ | '_ \  / _ \| '__|
| \__/\| | | || || (__ |   <|  __/| | | | | |/ / | || | | || | | ||  __/| |
 \____/|_| |_||_| \___||_|\_\\\\___||_| |_| |___/  |_||_| |_||_| |_| \___||_|
}

# Some "arbitrary" file names
FILENAMES = %w{ Battlefield BioShock Borderlands Burnout Castlevania Crysis Deponia
                Doom Elite Fallout Halo Hitman Minecraft Payday Prey Quake Rayman Risen
                Splatoon Thief Uncharted Witcher Wolfenstein Yakuza Zork }
