This is the developer repo of the addon. I might be testing new features and bug fixes at any time. Using this repo for pruduction use is **not recommended**

**Host Bitfocus Companion on your Pi/Odroid/HassOS as a Home Assistant Add-on**

This setup allows you to run Companion directly within Home Assistant. It integrates smoothly with the Stream Deck Companion plugin and is likely compatible with Companion Satellite as well.

**Installation Instructions:**

    Open Home Assistant.

    Go to Add-ons.

    Click the button to add a new repository.

    Click the three dots in the upper right corner and select Repositories.

    Add this link:
    https://github.com/avdmr/bitfocus-companion-hass-addon

    Click Save.

    Install the Companion add-on and start hosting Bitfocus Companion!

**To get started:**

    Create a Companion button on a Stream Deck page.

    Click "Open Companion Plugin General Configuration".

    Enter the IP address of your Home Assistant instance to connect.
    
    
**Troubleshooting**

Apparently, the add-on may cause problems with other add-ons that use USB devices plugged into the device running HassOS.
To work around this issue:

    Stop the other add-on(s) that use a USB device
    
    Restart the Companion add-on
    
    Then restart the other add-on(s)
