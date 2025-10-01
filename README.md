# softfloat-gcc

## Overview
This repository provides a **GCC build and debug environment** tailored for working with the [SoftFloat](https://www.jhauser.us/arithmetic/SoftFloat.html) library.  

The environment includes:
- A configured **GCC toolchain** for compiling SoftFloat sources and test programs.  
- An integrated **GDB debugger** with **Visual Studio Code (VS Code)** for step-by-step debugging and inspection.  

---

## GCC Environment Setup
The GCC environment is configured to:
- Compile SoftFloat sources (`.c` / `.h`) into executables.  
- Use `tasks.json` in VS Code to build projects automatically.  
- Provide support for flexible builds (debug, release).  

### Key Features
- **Compiler:** `gcc` (system-provided)  
- **Flags:**  
  - `-Wall -Wextra -O2` for safe, optimized builds  
  - `-g` for debug information  
- **Build Automation:** via `tasks.json` (example below)

## VS Code Debugger Setup (GDB)

The environment also provides **VS Code debug configuration** using GDB.
This allows you to set breakpoints, inspect variables, and step through SoftFloat code directly.

---

## Usage

1. Open the project in **VS Code**.
2. Press `Ctrl+Shift+B` (or `Run Build Task`) to build SoftFloat. To use Makefile, type `make run_main` to build the main.c file.
3. Add breakpoints in SoftFloat code to analyze execution.

---

## Project Structure

```
softfloat-gcc/
├── softfloat/         # SoftFloat source files (.c/.h)
├── main.c             # Main file that calls Softfloat
├── .vscode/
│   ├── tasks.json     # GCC build config
│   └── launch.json    # GDB debug config
└── README.md          # documentation
```

---

## Notes

* Ensure **GCC** and **GDB** are installed:

  ```bash
  sudo apt update
  sudo apt install build-essential gdb -y
  ```
* Works on Debian/Ubuntu systems by default.

---

