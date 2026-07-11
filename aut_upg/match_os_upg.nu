git fetch
git merge

# 実行環境ごとに条件分岐して処理を分ける

let sys_name = (sys host | get name)
let  sys_hostname = (sys host | get hostname)
if ($sys_name | str contains "Windows") or ($sys_name | str contains "windows") {
    print "Windows OS detected"
    source ./win/win_upg.nu
} else if ($sys_name | str contains "Ubuntu") or ($sys_name | str contains "ubuntu") {
    print "Ubuntu OS detected"
    source ./ubuntu/ubuntu_upg.nu
} else if ($sys_name | str contains "Debian") or ($sys_name | str contains "debian") {
    print "Debian OS detected"
    if (($sys_hostname | str contains "Raspberrypi") or ($sys_hostname | str contains "raspberrypi")) {
        print "Raspberry Pi OS detected"
        source ./rpi/rpi_upg.nu
    } else {
        print "Debian OS detected"
        source ./common/debians_upg.nu
    }
} else if ($sys_name | str contains "Kali") or ($sys_name | str contains "kali") {
    print "Kali Linux OS detected"
    source ./common/debians_upg.nu
} else if ($sys_name | str contains "Arch") or ($sys_name | str contains "arch") {
    print "Arch Linux OS detected"
    source ./arch/arch_upg.nu
} else if ($sys_name | str contains "Android") or ($sys_name | str contains "android") {
    print "Android OS detected"
    source ./termux/termux_upg.nu
} else {
    print ("未対応のOS:" + (sys host | get name))
}
print "正常性は保証しませんが、"
print "アップデート処理が中断せずに終了しました。"
