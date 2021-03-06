

# Linux

## Swap

swappiness: Start swapping when free RAM is down to that level.

- To change the swappiness level temporarily: `sudo sysctl vm.swappiness=10`
- To change it permanently: 
    - `vi /etc/sysctl.conf`
    - Add a line at the bottom: `vm.swappiness=10`
- To check current swappiness level: `cat /proc/sys/vm/swappiness`
- To turn off swap completely: `sudo swapoff -a` (will not persist after a reboot)


## GNOME

`sudo apt install gnome-tweak-tool`

- Dash to Panel: https://extensions.gnome.org/extension/1160/dash-to-panel/
  - To customize the taskbar, can make it more windows like

- Multi Monitors Add-On: https://extensions.gnome.org/extension/921/multi-monitors-add-on/
  - Primarily to make all monitors switch when we switch workspace

#### Keyboard switch not working

##### Option 1

When switching the keyboard seems to work (in language bar) but the actual keys still output the other keyboard, refresh GNOME.

- ALT-F2
- r
- ENTER

##### Option 2

Open the `Language and Region` settings and switch the keyboards order.


### Restart GNOME (frozen)

Log in through ssh or open a prompt (CTRL-ALT-F3)

`sudo killall -3 gnome-shell`


## RDP on multiple monitors

Use FreeRDP:

`sudo apt install freerdp2-x11`

`xfreerdp /multimon /u:username /microphone /sound /fonts /network:auto +aero /gfx /v:192.168.0.10`

## Geany

Fix for missing `_` 

Tools > Configuration Files > filetypes.common

```
[styling]
line_height=0;2;
```

## KDiff3

Fix for missing `_` 

Settings > Configure Kdiff3 > File view font > Arial Regular 11

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

