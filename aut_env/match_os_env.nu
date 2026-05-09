#インストーラーは未実装なため、本リポジトリはクローン済みであると仮定して実行する
if not ((which git) | is-empty) {
    print "Gitがインストールされていることを確認しました。"
    print "本Gitリポジトリを更新します。"
    # Gitのリポジトリを更新
    git fetch
    git merge
} else {
    print "Gitが確認できません。Gitのインストールや環境変数設定によって動作可能にしてください。"
    exit 1
}

# 実行環境ごとに条件分岐して処理を分ける

match (sys host | get name) {
    "Windows" => (
        # Windows用の処理
        source ./win_env.nu
    )
    "Ubuntu" => (
        # Ubuntu用の処理
        source ./ubuntu_env.nu
    )
    "Debian" => (
        # Linux用の処理
        source ./debians_env.nu
    )
    "Kali" => (
        # Kali Linux用の処理
        # ただし、Debian用コードを流用
        source ./debians_env.nu
    )
    _ => {
        # Windows用の処理
        # Ubuntu用の処理
        #source ./ubuntu_env.nu
        # Linux用の処理
        #source ./debians_env.nu
        # Kali Linux用の処理
        # ただし、Debian用コードを流用
        #source ./debians_env.nu
        if $nu.os-info.name in ["Android", "android"] {
            # Android用の処理
            # Termuxは、
            # host名が端末名かつ、
            # nuのOS情報がAndroidなので、
            # Termuxとして処理する
            #source ./termux_env.nu
            print "Termux用のインストール処理は未実装です。"
        } else {
            print ("未対応のOS:" + (sys host | get name))
        }
    }
}

print "正常性は保証しませんが、"
print "インストール処理が中断せずに終了しました。"
