# sudo / chown
@exercises << Exercise.new(
    'What a Superuser can do',
    'Machen Sie sich mit der Funktionsweise von sudo und chown vertraut.',
    %Q{
      Nutzen Sie die Macht eines Superusers und setzen den Besitzer des Ordners "shady-business" auf "nobody", damit man Ihnen später nichts nachsagen kann.
    },
    :enter,
    'sudo chown nobody shady-business',
    -> () { `#{STAT_USER} #{PATH}/shady-business`.strip == 'nobody' },
    -> () { mkdir("#{PATH}/shady-business"); fill_dir("#{PATH}/shady-business") }
)
