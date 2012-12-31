This repository contains the source code for the ARM side libraries used on Raspberry Pi.
These typically are installed in /opt/vc/lib and includes source for the ARM side code to interface to:
EGL, mmal, GLESv2, vcos, openmaxil, vchiq_arm, bcm_host, WFC, OpenVG.

This is an effort to create an Android-compatible version of the libraries. It <em>should</em> be usable as of commit '168441d31c'. However, as there's no working gralloc module for Android on the Raspberry Pi, there's no real way of knowing if it is. If you happen to discover any issue with the libs, post an issue and it'll be looked into, or better yet, fork me and fix it yourself, then gimme a pull request.

Use buildme.android to build. It requires cmake to be installed and an arm cross compiler.
Before running buildme.android, set the environment variables 'ANDROID_ROOT' to your root-Android-dir (as in, your CyanogenMod source tree with proper RPi-patches etc), and 'ANDROID_TOOLCHAIN' to your toolchain's /bin dir.</p>

Contact: #razdroid @ irc.freenode.net -- My nick is Warg.
