# Schnitzel (jagd)

Learn the Linux console with a small game. The name is inspired by the German term for a paper chase "Schnitzeljagd". The exercises are in German, so it is not directly usable for English speakers.

## Prerequisites

The game is based on Ruby and requires at least Ruby 2.4 to run. No additional Gems required.

## Platform

The game was tested on

  * [Ubuntu 22.10](http://releases.ubuntu.com/22.10/)
  * [Ubuntu 19.04](http://releases.ubuntu.com/19.04/)
  * [Ubuntu 18.04](http://releases.ubuntu.com/18.04/)
  * [Manjaro Linux 18.1](https://manjaro.org/download/)
  * MacOS 10.14 (Mojave)
  * MacOS 10.15.3 (Catalina)

## Installation / Download

  * Install Ruby (if not present)
  * Download the latest release [here](https://github.com/informatik-mannheim/schnitzel/releases/tag/v1.0).
  * Make the file executable (`chmod a+x schnitzel`)
  * Execute it

## Usage

You can directly execute the program from the `src` folder by starting the `schnitzel.rb` script. For production use, bundle all parts of the program into one single file with `bin/build.rb` and transfer the resulting file `schnitzel` to the target machine.

## Structure

  * `bin` - Build scripts
    - `build.rb` - Build the `schnitzel` script
    - `generate_chaos.rb` - Generate the file `chaos.tar.xz` that must be downloaded and unpacked by the players.
  * `src` - Folder with the sources that are bundled together to the `schnitzel` script
    - `exercises/` - The single exercises
    - `schnitzel.rb` - The script's source (can also be executed but consists of multiple parts)
    - `helper.rb` - Helper functions
    - `exercise.rb` - The class for the exercises
    - `settings.rb` - Settings for the program (pathnames etc.)
    - `Makefile` - Simple make file to build the whole schnitzel experience
  * `schnitzel` - Game itself (only file needed on the target machine). Build it with `bin/build.rb` or `src/Makefile`.
  * `files` - files included during the creation of the `chaos.tar.xz`
  * `chaos.tar.xz` - file the students download during the exercise, containing additional material (see [files](files/) folder)

## Author

The game is developed by [Thomas Smits](https://github.com/thomsmits/).

## Acknowledgement

This program is based on the idea of Eugen Krizki and Richard Vladimirskij and their framework [pepio](https://github.com/limecakeio/pepio). Due to the many dependencies and problems with the node.js based pepio, I decided to do a complete re-implementation and extension in Ruby. The goal was to have one single file which can be downloaded and executed easily.

