git fetch
git merge

# 実行環境ごとに条件分岐して処理を分ける

match (sys host | get name) {
    (str contains "Windows") => (
        # Windows用の処理
        source ./win/win_upg.nu
    )
    (str contains "Ubuntu") => (
        # Ubuntu用の処理
        source ./ubuntu/ubuntu_upg.nu
    )
    (str contains "Debian") => (
        if ((sys host | get hostname)  | str contains "raspberrypi") {
            # Raspberry Pi OS用の処理
            source ./rpi/rpi_upg.nu
        } else {
            # Linux用の処理
            # contain Android official terminal debian OS
            source ./common/debians_upg.nu
        }
    )
    (str contains "Kali") => (
        # Kali Linux用の処理
        source ./common/debians_upg.nu
    )
    _ => {
        if ($nu.os-info.name | str contains ["Android", "android"]) {
            # Androidのtermux用の処理
            # Termuxは、
            # host名が端末名かつ、
            # nuのOS情報がAndroidなので、
            # Termuxとして処理する
            source ./termux/termux_upg.nu
        } else {
            print ("未対応のOS:" + (sys host | get name))
        }
    }
}

print "正常性は保証しませんが、"
print "アップデート処理が中断せずに終了しました。"
