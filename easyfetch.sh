#!/bin/bash

# Define colors for text
RED='\033[0;31m'
WHITE='\033[1;37m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
PURPLE='\033[0;35m'
NC='\033[0m' # No Color

# Check if Neofetch is installed; if not, install it
if ! command -v neofetch &> /dev/null; then
    echo "Neofetch could not be found. Installing..."
    sudo apt-get update
    sudo apt-get install -y neofetch
    clear
fi

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Function to get storage info
get_storage() {
    df -h / | awk 'NR==2 {print $3 "/" $2}'
}

# Function to get RAM info
get_ram() {
    free -h | awk '/^Mem:/ {print $3 "/" $2}'
}

# Function to get kernel version
get_kernel() {
    uname -r
}

# Function to get shell
get_shell() {
    echo $SHELL
}

# Function to get resolution
get_resolution() {
    if command_exists xdpyinfo && [ -n "$DISPLAY" ]; then
        xdpyinfo | awk '/dimensions:/ {print $2}'
    else
        echo "N/A"
    fi
}

# Function to get terminal
get_terminal() {
    echo $TERM
}

# Function to get CPU info
get_cpu() {
    if command_exists lscpu; then
        lscpu | awk -F: '/Model name/ {print $2}' | sed 's/^[ \t]*//'
    else
        echo "lscpu not found"
    fi
}

# Function to get GPU info
get_gpu() {
    if command_exists lspci; then
        lspci | grep -E "VGA|3D" | awk -F: '{print $3}' | sed 's/^[ \t]*//'
    else
        echo "lspci not found"
    fi
}

# Function to get uptime
get_uptime() {
    uptime -p
}

# Function to get OS info
get_os() {
    grep '^PRETTY_NAME=' /etc/os-release | cut -d= -f2- | tr -d '"'
}

# Function to display OS image using Neofetch
display_os_image() {
    case "$1" in
        *"Alpine Linux"*)
            neofetch --ascii_distro alpine --ascii_colors 6  # Cyan
            ;;
        *"Kali Linux"*)
            neofetch --ascii_distro kali --ascii_colors 4  # Blue
            ;;
        *"Arch Linux"*)
            neofetch --ascii_distro arch --ascii_colors 6  # Cyan
            ;;
        *"CentOS"*)
            neofetch --ascii_distro centos --ascii_colors 5  # Purple
            ;;
        *"Fedora Linux"*)
            neofetch --ascii_distro fedora --ascii_colors 4  # Blue
            ;;
        *"Ubuntu"*)
            neofetch --ascii_distro ubuntu --ascii_colors 1  # Red
            ;;
        *"Red Hat Enterprise Linux"*)
            neofetch --ascii_distro rhel --ascii_colors 1  # Red
            ;;
        *"SUSE Linux Enterprise"*)
            neofetch --ascii_distro suse --ascii_colors 2  # Green
            ;;
        *"MX Linux"*)
            neofetch --ascii_distro mx --ascii_colors 4  # Blue
            ;;
        *"Manjaro"*)
            neofetch --ascii_distro manjaro --ascii_colors 2  # Green
            ;;
        *"Linux Mint"*)
            neofetch --ascii_distro mint --ascii_colors 2  # Green
            ;;
        *"Raspbian"*)
            neofetch --ascii_distro raspbian --ascii_colors 1  # Red
            ;;
        *)
            echo -e "${WHITE}            .---.${NC}"
            echo -e "${WHITE}         .--------.${NC}"
            echo -e "${WHITE}       .--( . . )--.${NC}"
            echo -e "${WHITE}        (    \\/    )${NC}"
            echo -e "${WHITE}         `-------'${NC}"
            ;;
    esac
}

# Collect all information
storage=$(get_storage)
ram=$(get_ram)
kernel=$(get_kernel)
shell=$(get_shell)
resolution=$(get_resolution)
terminal=$(get_terminal)
cpu=$(get_cpu)
gpu=$(get_gpu)
uptime=$(get_uptime)
os=$(get_os)

# Display the information
os_image=$(display_os_image "$os")
echo -e "$os_image"
echo -e "${WHITE}Storage:${NC}        $storage"
echo -e "${WHITE}RAM:${NC}            $ram"
echo -e "${WHITE}Kernel:${NC}         $kernel"
echo -e "${WHITE}Shell:${NC}          $shell"
echo -e "${WHITE}Resolution:${NC}     $resolution"
echo -e "${WHITE}Terminal:${NC}       $terminal"
echo -e "${WHITE}CPU:${NC}            $cpu"
echo -e "${WHITE}GPU:${NC}            $gpu"
echo -e "${WHITE}Uptime:${NC}         $uptime"
echo -e "${WHITE}OS:${NC}             $os"
