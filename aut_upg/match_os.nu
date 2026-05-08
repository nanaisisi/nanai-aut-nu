git fetch
git merge

# 実行環境ごとに条件分岐して処理を分ける

match (sys host | get name) {
    "Windows" => (
        # Windows用の処理
        source win_upg.nu
    ),
    "Ubuntu" => (
        # Ubuntu用の処理
        source ubuntu_upg.nu
    ),
    "Debian" => (
        if(sys host | get hostname) == "raspberrypi" {
            # Raspberry Pi OS用の処理
            source rpi_upg.nu
        }
        # Linux用の処理
        source debians_upg.nu
    ),
    "Kali" => (
        # Kali Linux用の処理
        source debians_upg.nu
    ),
    _ => {
        if $nu.os-info.name in ["Android", "android"] {
            # Android用の処理
            # Termuxは、
            # host名が端末名かつ、
            # nuのOS情報がAndroidなので、
            # Termuxとして処理する
            source termux_upg.nu
        } else {
            print ("未対応のOS:" + (sys host | get name))
        }
    }
}

print "正常性は保証しませんが、"
print "アップデート処理が中断せずに終了しました。"