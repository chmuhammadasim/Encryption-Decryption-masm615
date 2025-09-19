
# Encryption-Decryption MASM615

A comprehensive encryption and decryption program developed entirely in Assembly Language using XOR bitwise operations. This project demonstrates secure data handling, file I/O operations, and low-level programming concepts in a user-friendly console interface.

## Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Technical Specifications](#technical-specifications)
- [Program Functionality](#program-functionality)
- [Installation & Setup](#installation--setup)
- [Usage Guide](#usage-guide)
- [File Structure](#file-structure)
- [Technical Implementation](#technical-implementation)
- [Deployment](#deployment)
- [Troubleshooting](#troubleshooting)
- [Contributing](#contributing)
- [License](#license)
- [Author](#author)
- [Acknowledgments](#acknowledgments)

## Overview

The Encryption-Decryption project is a semester project that showcases the power of Assembly Language in implementing cryptographic operations. Built using MASM615, this program provides a complete solution for encrypting text data using XOR operations and storing it securely in files.

### Key Highlights

- **Pure Assembly Language Implementation**: Demonstrates low-level programming expertise
- **XOR Encryption Algorithm**: Simple yet effective symmetric encryption
- **File-based Data Persistence**: Secure storage and retrieval of encrypted data
- **Interactive Menu System**: User-friendly console interface
- **Educational Value**: Perfect for understanding encryption concepts and Assembly programming

## Features

- **🔐 Data Encryption**: Encrypt text strings using XOR bitwise operations
- **🔓 Data Decryption**: Decrypt and view original data seamlessly  
- **💾 File Operations**: Store encrypted data in files (`MICHU.txt`)
- **👁️ Data Visualization**: Display encrypted data in its raw form
- **🗑️ Data Management**: Delete stored encrypted data
- **📋 Menu-Driven Interface**: Easy-to-use console navigation
- **⚡ Fast Processing**: Optimized Assembly code for efficient execution
- **🔄 Session Management**: Continue operations until user exits

## Technical Specifications

| Specification | Details |
|---------------|---------|
| **Language** | Assembly Language (MASM615) |
| **Architecture** | x86 (16-bit) |
| **Memory Model** | Small Model |
| **Stack Size** | 100h bytes |
| **Encryption Method** | XOR Bitwise Operation |
| **File Format** | Plain text (.txt) |
| **Platform** | DOSBox recommended |
| **Assembler** | MASM615 |

## Program Functionality

The program offers five main operations through an interactive menu:

### Menu Options

```
----------------------------------
1-ADD Data in Encrypted file
2-Read decrypted data
3-show Data from Encrypted file
4-Delete Data from Encrypted file
5-Exit Program
----------------------------------
```

### Detailed Operation Descriptions

#### 1. ADD Data in Encrypted File
- Prompts user to enter a string
- Applies XOR encryption (key: 1)
- Stores encrypted data in `MICHU.txt`
- Confirms successful encryption

#### 2. Read Decrypted Data
- Reads encrypted data from file
- Applies XOR decryption to restore original text
- Displays the decrypted string on screen

#### 3. Show Data from Encrypted File
- Reads and displays raw encrypted data
- Shows the actual encrypted bytes stored in file
- Useful for understanding encryption results

#### 4. Delete Data from Encrypted File
- Allows user to specify file for deletion
- Creates user-defined files for data management
- Provides file creation confirmation

#### 5. Exit Program
- Safely terminates the application
- Cleans up resources and memory

## Installation & Setup

### Prerequisites

1. **DOSBox Emulator**
   - Download from [dosbox.com](https://www.dosbox.com/)
   - Install and configure DOSBox on your system

2. **MASM615 Assembler**
   - Ensure MASM615 is available in your DOSBox environment
   - Set up proper PATH variables for MASM tools

### Setup Instructions

1. **Clone the Repository**
   ```bash
   git clone https://github.com/chmuhammadasim/Encryption-Decryption-masm615.git
   cd Encryption-Decryption-masm615
   ```

2. **Mount Directory in DOSBox**
   ```dos
   mount c: /path/to/project/directory
   c:
   ```

3. **Compile the Program**
   ```dos
   masm asim.asm
   link asim.obj
   ```

4. **Run the Executable**
   ```dos
   asim.exe
   ```

## Usage Guide

### Starting the Program

1. Launch the compiled executable
2. The program displays a welcome screen with menu options
3. Enter your choice (1-5) when prompted

### Example Workflow

1. **Encrypt Data**:
   - Select option `1`
   - Enter your text string
   - Program encrypts and saves to file

2. **View Encrypted Data**:
   - Select option `3`
   - View the raw encrypted content

3. **Decrypt Data**:
   - Select option `2`
   - See your original text restored

4. **Exit**:
   - Select option `5` to terminate

### Sample Session
```
Enter Option : 1
Enter String 1: Hello World
Your data has been encrypted!

Enter Option : 3
encrypted Data: Ifmmp!Xpsme

Enter Option : 2
decryption: Hello World
```

## File Structure

```
Encryption-Decryption-masm615/
├── asim.asm          # Main assembly source code
├── asimlib.lib       # Assembly library file
├── README.md         # Project documentation
├── LICENSE          # MIT License file
├── MICHU.txt        # Generated encrypted data file (runtime)
└── .gitattributes   # Git configuration
```

### File Descriptions

- **`asim.asm`**: Core implementation containing all procedures and program logic
- **`asimlib.lib`**: External library providing additional assembly functions
- **`MICHU.txt`**: Default output file for storing encrypted data (created at runtime)

## Technical Implementation

### Encryption Algorithm

The program uses a simple XOR cipher with key value `1`:

```assembly
encryption proc near
    mov dx,offset mybuf1
    mov ah, 3Fh
    int 21h
    mov cx,lengthof mybuf1
    mov bx,0
    l1:
    xor mybuf1[bx],1    ; XOR each byte with 1
    inc bx
    loop l1
    ret
encryption endp
```

### Key Components

1. **Data Structures**:
   - Menu strings for user interface
   - Input/output buffers (100 bytes)
   - File handle management
   - User choice storage

2. **File Operations**:
   - File creation and opening
   - Reading and writing encrypted data
   - Proper file handle management

3. **Memory Management**:
   - Register clearing procedures
   - Stack and data segment setup
   - Buffer management

### Security Considerations

- **XOR with key `1`**: Simple encryption suitable for educational purposes
- **File-based storage**: Data persists between program sessions
- **Memory clearing**: Registers are cleared after operations

## Deployment

### Production Environment

For optimal deployment and execution:

1. **Recommended Platform**: DOSBox v0.74 or higher
2. **Assembler**: MASM615 (Microsoft Macro Assembler)
3. **Memory Requirements**: Minimal (16-bit addressing)
4. **Storage**: Small footprint (~10KB for source files)

### Compilation Steps

```dos
# Step 1: Assemble source code
masm asim.asm;

# Step 2: Link object file
link asim.obj;

# Step 3: Run executable
asim.exe
```

### Distribution

The compiled executable (`asim.exe`) can be distributed independently with DOSBox for cross-platform compatibility.

## Troubleshooting

### Common Issues

1. **"File not found" error**
   - Ensure `asimlib.lib` is in the same directory
   - Check file permissions

2. **Compilation errors**
   - Verify MASM615 is properly installed
   - Check syntax and include paths

3. **Runtime crashes**
   - Ensure sufficient memory in DOSBox
   - Check stack size configuration

4. **File access issues**
   - Verify write permissions in directory
   - Check if `MICHU.txt` is locked by another process

### Debug Tips

- Use DOSBox's debug mode for step-by-step execution
- Check register values during encryption/decryption
- Verify file contents with hex editor

## Contributing

Contributions are welcome! Here's how you can help:

### How to Contribute

1. **Fork the Repository**
2. **Create a Feature Branch**
   ```bash
   git checkout -b feature/amazing-feature
   ```
3. **Make Your Changes**
   - Follow assembly coding conventions
   - Add comments for complex operations
   - Test thoroughly in DOSBox
4. **Commit Your Changes**
   ```bash
   git commit -m 'Add amazing feature'
   ```
5. **Push to Branch**
   ```bash
   git push origin feature/amazing-feature
   ```
6. **Open a Pull Request**

### Contribution Guidelines

- Maintain code readability and documentation
- Test all changes in DOSBox environment
- Follow existing code style and structure
- Update README if adding new features

## Badges

[![MIT License](https://img.shields.io/badge/License-MIT-green.svg)](https://choosealicense.com/licenses/mit/)
[![Assembly](https://img.shields.io/badge/Language-Assembly-blue.svg)](https://github.com/chmuhammadasim/Encryption-Decryption-masm615)
[![Platform](https://img.shields.io/badge/Platform-DOSBox-orange.svg)](https://www.dosbox.com/)

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Author

**Muhammad Asim Chattha**
- GitHub: [@chmuhammadasim](https://www.github.com/chmuhammadasim)
- Institution: Air University, Islamabad, Pakistan
- Field: Computer Science Student

### 🚀 About Me

Hello, I'm Muhammad Asim Chattha, a dedicated Computer Science student currently pursuing my studies at Air University in Islamabad, Pakistan. This Encryption-Decryption project represents my semester work, showcasing expertise in Assembly Language programming and cryptographic concepts.

This project is not just a coding exercise but a journey into the realm of secure data handling through the ingenious use of XOR bitwise operations, demonstrating the power and precision of low-level programming.

## Acknowledgments

- **Air University** - For providing the educational foundation
- **Assembly Language Community** - For continuous learning resources
- **DOSBox Development Team** - For maintaining compatibility
- **Open Source Community** - For inspiration and collaboration opportunities

---

Feel free to explore, contribute, and delve into the fascinating world of assembly language and encryption! ⚡🔐