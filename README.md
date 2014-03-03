ubuntu-html5-app-screenshots
============================

This scripts allows you to quickly create screenshots with a real device frame
of your HTML5 apps running on the `ubuntu-html5-app-launcher`.  
This provides better visual context for your HTML5 app screenshots on your web site or in other promotional materials.

The device image is licensed under Creative Commons Attribution 2.5.  
For details and restrictions, see http://developer.android.com/distribute/promote/device-art.html

Usage
-------

You need install some system packages

```bash
sudo apt-get install imagemagick wmctrl x11-utils
```

launch the `ubuntu-html5-app-launcher` from the [Ubuntu SDK](http://developer.ubuntu.com/apps/html-5/tutorials/meanings-app-html5-tutorial/),
open a terminal window and enter

```bash
./ubuntu-html5-app-screenshots.sh
```

Screenshots are stored by default into `screenshots/`.
