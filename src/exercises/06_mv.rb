# mv
@exercises << Exercise.new(
    'Geld stinkt nicht',
    'Machen Sie sich mit der Funktionsweise von mv vertraut.',
    %Q{
      Ihr Steuerberater braucht noch weitere Unterlagen, die alle im Ordner `#{PROJEKT_PATH}/laundry` liegen.

      _Bewegen_ Sie den Ordner `laundry`, samt seines Inhaltes, in das `tax-man`-Verzeichnis in `#{PROJEKT_PATH}`.
    },
    :enter,
    'mv laundry tax-man',
    -> () do
        ok = true
        ('a'..'z').each { |l| ok = ok && File.exists?("#{PATH}/tax-man/laundry/#{l}") }
        Dir.exists?("#{PATH}/tax-man/laundry") &&
        !Dir.exists?("#{PATH}/laundry") && ok
    end,
    -> () do
      mkdir("#{PATH}/laundry")
      ('a'..'z').each { |l| File.write("#{PATH}/laundry/#{l}", "--egal--") }
    end
)
