# tr
SPEISEKARTE = "Speisekarte\n\n" +
          "Jägerschnitzel        12,80\n" +
          "Wiener Schnitzel      10,70\n" +
          "Schnitzel ohne Pommes  9,88\n" +
          "Bier (0,3l)            2,70\n" +
          "Coca Cola (0,33l)      2,50\n"

@exercises << Exercise.new(
    '1337 Verschlüsselung.',
    'Machen Sie sich mit der Funktionsweise von "tr" vertraut.',
    %Q{
      Sie haben Sorgen, dass die Konkurrenz Ihre Schnitzelpreise erfährt. Deswegen haben Sie sich entschlossen, Ihre Speisekarte mit mit dem Leet-Verfahren (auch als 1337 bekannt) zu verschlüsseln. Hierzu ersetzen Sie jedes Vorkommen des Buchstaben `a`, `e`, `i`, `o`, `t` jeweils durch `4`, `3`, `1`, `0`, `7`.

      Nehmen Sie die Textdatei `speisekarte.txt` aus `#{PROJEKT_PATH}` und erzeugen Sie mit `tr` eine verschlüsselte Version namens `speisekarte-geheim.txt`, die Sie im selben Ordner ablegen.
    },
    :enter,
    'cat speisekarte.txt | tr "aeiot" "43107" > speisekarte-geheim.txt',
    -> () do
      contents = File.read("#{PATH}/speisekarte-geheim.txt") rescue ""
      contents == SPEISEKARTE.tr("aeiot", "43107")
    end,
    -> () do
      create_workdir
      File.write("#{PATH}/speisekarte.txt", SPEISEKARTE)
    end
)
