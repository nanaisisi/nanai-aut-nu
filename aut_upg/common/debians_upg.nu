# x86_64 実機 / 仮想機 debian / kail / ubuntu

if not ((which apt) | is-empty) {
    sudo apt update -y
    sudo apt dist-upgrade -y
}

source ./not_termux_upg.nu
source ./posix_upg.nu
source ./cargo_upg_etc.nu
