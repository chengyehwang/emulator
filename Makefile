cmd:
	wget https://dl.google.com/android/repository/commandlinetools-linux-7302050_latest.zip
list_image:
	./cmdline-tools/bin/sdkmanager --list --sdk_root=${PWD} | grep system-images
image:
	./cmdline-tools/bin/sdkmanager --install "system-images;android-31;google_apis;x86_64" --sdk_root=${PWD}
sim:
	echo "no" | ./cmdline-tools/bin/avdmanager --verbose create avd --force --name "android-31" --package "system-images;android-31;google_apis;x86_64" --tag "google_apis" --abi "x86_64"

platform-tools:
	./cmdline-tools/bin/sdkmanager --install "platform-tools" --sdk_root=${PWD}
platforms:
	./cmdline-tools/bin/sdkmanager --install "platforms;android-31" --sdk_root=${PWD}
run:
	./emulator/emulator -avd android-31
