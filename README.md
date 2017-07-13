# A Snake remake with Vala and SDL2

## Required dependencies:

- Vala compiler
- meson
- gcc
- mingw-gcc (For windows builds)
- GLib (dev)
- GObject (dev)
- SDL2 (dev)
- SDL2-ttf (dev)
- SDL2-image (dev)
- SDL2-mixer (dev)

Those marked as _dev_ are libraries we need the development packages

## Compiling on Linux:

```
mkdir build
meson build
cd build
ninja
```

## Cross compiling for Windows:

_Windows 32bits_
```
mkdir build-windows32
meson --cross-file windows32-build.conf build-windows32/
cd build-windows32
ninja
```

_Windows 64bits_
```
mkdir build-windows64
meson --cross-file windows64-build.conf build-windows64/
cd build-windows64
ninja
```
