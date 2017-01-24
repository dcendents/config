

# Linux

## Free space in /boot (remove all unused kernels)

`sudo apt-get purge $(dpkg -l linux-{image,headers}-"[0-9]*" | awk '/ii/{print $2}' | grep -ve "$(uname -r | sed -r 's/-[a-z]+//')")`


## Chrome fix mouse selection

Edit '/opt/google/chrome/google-chrome' file and add '--touch-devices=123' in last couple of lines as shown below. You are all set to go

`#sudo vi /opt/google/chrome/google-chrome`

```bash
if [[ -n "$CHROME_USER_DATA_DIR" ]]; then
  # Note: exec -a below is a bashism.
  exec -a "$0" "$HERE/chrome"  \
    --user-data-dir="$CHROME_USER_DATA_DIR" --touch-devices=123 "$@"
else
  exec -a "$0" "$HERE/chrome" --touch-devices=123 "$@"
fi
```


## Install Android SDK

```bash
sudo wget https://dl.google.com/android/android-sdk_r24.4.1-linux.tgz

sudo tar zxvf android-sdk_r24.4.1-linux.tgz

cd /android-sdk-linux/tools

sudo ./android list sdk --all
 
sudo ./android update sdk -u -a -t 32
echo y | sudo ./android update sdk --no-ui --all --filter "tools,android-24,build-tools-24.0.0,platform-tools,extra-android-m2repository,extra-google-m2repository" 
```

