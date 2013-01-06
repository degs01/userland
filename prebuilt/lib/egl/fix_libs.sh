#!/bin/bash

echo "This will set up the libs properly."
echo ""
echo "Removing old libs..."
rm -rf libGLESv2_rpi.so
rm -rf libGLES_rpi.so
echo "Done."
echo "Linking new libs..."
ln -s libEGL_rpi.so libGLES_rpi.so
ln -s libEGL_rpi.so libGLESv2_rpi.so
echo "Done."
echo "Making egl.cfg..."
echo "0 1 rpi" > egl.cfg
echo "Done."
echo ""
echo ""
echo "Operation completed."
