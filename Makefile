cmd:
	wget https://dl.google.com/android/repository/commandlinetools-linux-7302050_latest.zip
list_image:
	./cmdline-tools/bin/sdkmanager --list --sdk_root=${PWD} | grep system-images
image:
	./cmdline-tools/bin/sdkmanager --install "system-images;android-31;google_apis;x86_64" --sdk_root=${PWD}
