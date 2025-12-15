# Equilinox Mod Loader

A lightweight Java agent–based mod loader for **Equilinox** that enables runtime injection and modding without modifying the original game files.

---

## Overview

Equilinox Mod Loader injects into the game at startup using the Java Instrumentation API.  
It allows developers to intercept class loading, apply bytecode transformations, and extend or modify game behavior entirely at runtime.

This project is intended for learning, experimentation, and community-made mods.

---

## Features

- Java agent injection (`-javaagent`)
- Runtime class transformation
- No modification of original game files
- Compatible with Java 8 (as used by Equilinox)

---

## TODO
- add Foundation for UI, menu, and gameplay mods

---

## Requirements

- Java 8 (JDK for building, JRE for running)
- Equilinox (official game files)
- Windows (current setup)

---

## Building

1. Run the provided build script:

---

## How to Run

1. Put `EquilinoxModLoader.jar` and `run_modded (Put me in the root game dir).bat` in the same folder as `EquilinoxWindows.jar`.  
   - For Steam users, the default location is usually:  
     ```
     C:\Program Files (x86)\Steam\steamapps\common\Equilinox
     ```
2. Double-click the provided launcher, or run this command: