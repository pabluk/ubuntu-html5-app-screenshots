#!/bin/bash
# This script is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

DEFAULT_FRAME=assets/nexus4.png
OUTPUT_DIR=screenshots
WINDOW_NAME=ubuntu-html5-app-launcher

TIMESTAMP=`date +"%Y-%m-%d-%s"`

APP_SCREENSHOT=$OUTPUT_DIR/$TIMESTAMP-screenshot-app.png
DEVICE_SCREENSHOT=$OUTPUT_DIR/$TIMESTAMP-screenshot-device.png

WINDOW_ID=`/usr/bin/xwininfo -name $WINDOW_NAME 2> /dev/null | grep "Window id:" | cut -d " " -f 4`
if [ -z "$WINDOW_ID" ]; then
    echo "Window not found. You must run ubuntu-html5-app-launcher."
    echo "See http://developer.ubuntu.com/apps/html-5/tutorials/meanings-app-html5-tutorial/ for more details."
    echo ""
    exit 1
fi

# Create ouput directory
mkdir -p $OUTPUT_DIR

# Resize window to adjuste aspect ratio to mobile phone portrait
/usr/bin/wmctrl -i -r $WINDOW_ID -e 0,-1,-1,480,800

# Capture app screenshot
/usr/bin/import -window $WINDOW_ID -resize 768 $APP_SCREENSHOT

# Combine app screenshot with device frame
/usr/bin/convert $DEFAULT_FRAME -page +213+350 $APP_SCREENSHOT -background none -flatten $DEVICE_SCREENSHOT
