.PHONY: all
all: ../chaos.tar.xz \
	../schnitzel

../chaos.tar.xz: ../bin/generate_chaos.rb ../files/*.txt
	cd ../bin && ./generate_chaos.rb

../schnitzel: ../chaos.tar.xz schnitzel.rb helper.rb exercise.rb exercises/*.rb
	cd ../bin && ./build.rb
