# Schnitzel (jagd)

Learn the Linux console with a small game. The name is inspired by the German term for a paper chase "Schnitzeljagd". The exercises are in German, so it is not directly usable for English speakers.

## Prerequisites

The game is based on Ruby and requires at least Ruby 2.4 to run. No additional Gems required.

## Platform

The game was tested on

  * Ubuntu 19.04
  * Ubuntu 18.04
  * MacOS 10.14 (Mojave)

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
  * `schnitzel` - Game itself (only file needed on the target machine). Build it with `bin/build.rb`.
  * `files` - files included during the creation of the `chaos.tar.xz`
  * `chaos.tar.xz` - file the students download during the exercise, containing additional material (see [files](files/) folder)

## Author

The game is developed by [Thomas Smits](https://github.com/thomsmits/).

## Acknowledgement

This program is based on the idea of Eugen Krizki and Richard Vladimirskij and their framework [pepio](https://github.com/limecakeio/pepio). Due to the many dependencies and problems with the node.js based pepio, I decided to do a complete re-implementation and extension in Ruby. The goal was to have one single file which can be downloaded and executed easily.

