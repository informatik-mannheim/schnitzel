# Schnitzel (jagd)

Learn the Linux console with a small game. The name is inspired by the German term for a paper chase "Schnitzeljagd". The exercises are in German, so it is not directly usable for English speakers.

## Prerequisites

The game is based on Ruby and requires at least Ruby 2.4 to run. No additional Gems required.

## Platform

The game was tested on

  * Ubuntu 19.04
  * Ubuntu 18.04
  * MacOS 10.14 (Mojave)

## Structure

  * `schnitzel.rb` - Game itself (only file needed on the target machine)
  * `generate_chaos.rb` - Script to generate the file `chaos.tar.xz` that must be downloaded and unpacked by the players.
  * `files` - files included during the creation of the `chaos.tar.xz`
  * `chaos.tar.xz` - file the students download during the exercise, containing additional material (see [files](files/) folder)

## Author

The game is developed by [Thomas Smits](https://github.com/thomsmits/).

## Acknowledgement

This program is based on the idea of Eugen Krizki and Richard Vladimirskij and their framework [pepio](https://github.com/limecakeio/pepio). Due to the many dependencies and problems with the node.js based pepio, I decided to do a complete re-implementation and extension in Ruby. The goal was to have one single file which can be downloaded and executed easily.
