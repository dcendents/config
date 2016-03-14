

# Linux

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
