# sudo / chown
@exercises << Exercise.new(
    'What a Superuser can do',
    'Machen Sie sich mit der Funktionsweise von sudo und chown vertraut.',
    %Q{
      Nutzen Sie die Macht eines Superusers und _ändern_ Sie den _Besitzer_ des Ordners `shady-business` auf `nobody`, damit man Ihnen später nichts nachsagen kann.
    },
    :enter,
    'sudo chown nobody shady-business',
    -> (os) do
      if os == :linux
        `stat -c %U #{PATH}/shady-business`.strip == 'nobody'
      elsif os == :macos
        `stat -f %Su #{PATH}/shady-business`.strip == 'nobody'
      end
    end,
    -> () { mkdir("#{PATH}/shady-business"); fill_dir("#{PATH}/shady-business") }
)
