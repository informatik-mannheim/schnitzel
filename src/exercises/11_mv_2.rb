# mv
@exercises << Exercise.new(
    'Move on...there is nothing to see here',
    'Frischen Sie Ihr Wissen zu mv ein wenig auf.',
    %Q{
      Das Finanzamt hat Unstimmigkeiten in Ihrer Steuererklärung festgestellt und Sie wollen Ihre Spuren zu den zwielichtigen Geschäften verwischen.

      _Änderen_ Sie den _Namen des Ordners_ `shady-business` in `nothing-to-see-here` um.
    },
    :enter,
    'sudo mv shady-business nothing-to-see-here',
    -> () { !File.exists?("#{PATH}/shady-business") && File.exists?("#{PATH}/nothing-to-see-here") }
)
