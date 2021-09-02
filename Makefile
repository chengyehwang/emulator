cmd:
	cd sdk ; wget https://dl.google.com/android/repository/commandlinetools-linux-7302050_latest.zip
	cd sdk ; unzip commandlinetools-linux-7302050_latest.zip
list_image:
	sdk/cmdline-tools/bin/sdkmanager --list --sdk_root=${PWD}/sdk | grep system-images
image:
	sdk/cmdline-tools/bin/sdkmanager --install "system-images;android-31;google_apis_playstore;x86_64" --sdk_root=${PWD}/sdk
studio:
	wget https://redirector.gvt1.com/edgedl/android/studio/ide-zips/2020.3.1.24/android-studio-2020.3.1.24-linux.tar.gz
sim:
	echo "no" | sdk/cmdline-tools/bin/avdmanager --verbose create avd --force --name "android-31" --package "system-images;android-31;google_apis_playstore;x86_64" --tag "google_apis_playstore" --abi "x86_64"

platform-tools:
	sdk/cmdline-tools/bin/sdkmanager --install "platform-tools" --sdk_root=${PWD}/sdk
platforms:
	sdk/cmdline-tools/bin/sdkmanager --install "platforms;android-31" --sdk_root=${PWD}/sdk
build:
	sdk/cmdline-tools/bin/sdkmanager --install "build-tools;31.0.0" --sdk_root=${PWD}/sdk
run:
	sdk/emulator/emulator -avd android-31 -ranchu -port 8888
perf:
	sudo perf record -e intel_pt//u ls
perf_ana:
	sudo perf script --insn-trace
