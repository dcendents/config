Windows
======

#### Adding quick launch in Windows 7

  1. Right-click an empty area of the taskbar, point to Toolbars, and then click New toolbar.
  1. In the dialog box, copy and then paste the following folder name to the Folder box, and then click Select Folder:
%AppData%\Microsoft\Internet Explorer\Quick Launch


#### Reset folder permissions

Take ownership of the folder:

    TAKEOWN /F E:\ /R /D Y


Set the permissions

    ICACLS "e:\" /reset /T


### Moving a window back on the screen

When the standard Shift+Windows+Arrows does not work, the following should fix it:

  1. Make sure the focus is on the window (Alt-Tab or select on Task bar)
  1. Right click on the app in the task bar and select Move (might need to Shift+Right-click)
  1. Press on one of the arrow keys, the window should appear
