Certainly! Here is the `README.md` file for `easyfetch.sh` in English:

---

# EasyFetch

**EasyFetch** is a simple script designed to display system information in a format similar to `neofetch`. It supports Linux and Windows, providing details about your system, including storage, RAM, kernel, shell, resolution, CPU, GPU, uptime, and operating system version.

## Features

- Displays detailed information about your system in a clear format.
- Supports various Linux distributions and Windows.
- Uses colors to enhance readability on compatible terminals.

## Installation

### Linux

1. **Clone the repository:**

   ```sh
   git clone https://github.com/mihai14launcher/easyfetch.git
   cd easyfetch
   ```

2. **Make the script executable:**

   ```sh
   chmod +x easyfetch.sh
   ```

3. **Run the script:**

   ```sh
   ./easyfetch.sh
   ```

### Windows

1. **Clone the repository:**

   ```bat
   git clone https://github.com/mihai14launcher/easyfetch.git
   cd easyfetch
   ```

2. **Run the script:**

   ```bat
   easyfetch.bat
   ```

   Note: Ensure that you have PowerShell installed and run the script with administrator privileges for complete results.

## Configuration

### Linux

To customize the `easyfetch.sh` script, you can edit the color variables and settings according to your preferences. Ensure that you have the necessary packages installed:

- `neofetch` (for system information)
- `xdpyinfo` (for screen resolution, if available)

### Requirements Packages to work EasyFetch for Linux
```bash
sudo apt-get update
sudo apt-get install x11-utils pciutils util-linux
```
### Windows

To customize the `easyfetch.bat` script, edit the color variables and settings according to your preferences. Ensure you have PowerShell installed for comprehensive system information.

## Usage

### Linux

The script will display information about your system, including:

- OS image and colors.
- Storage: used and total.
- RAM: used and total.
- Kernel: kernel version.
- Shell: the shell in use.
- Resolution: screen size.
- CPU: processor information.
- GPU: graphics card information.
- Uptime: system uptime.
- OS: operating system version and name.

### Windows

The script will display similar information for Windows, including:

- OS image and colors for the Windows version.
- Storage: used and total.
- RAM: used and total.
- Kernel: kernel version.
- Shell: the shell in use.
- Resolution: screen size.
- CPU: processor information.
- GPU: graphics card information.
- Uptime: system uptime.
- OS: operating system version and name.

## Contributing

If you wish to contribute to the project, please open an issue or pull request on [GitHub](https://github.com/mihai14launcher/easyfetch). We welcome suggestions and improvements!

## License

This project is licensed under the MIT License. See [LICENSE](LICENSE) for details.

---

### Discord : https://discord.gg/PXTtxEK7g8
