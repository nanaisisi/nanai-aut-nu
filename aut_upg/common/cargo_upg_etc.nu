mut cargo_binstall_update_run_flag = false
mut cargo_update_app_update_run_flag = false
mut erg_update_run_flag = false
mut nu_update_run_flag = false
mut cargo_all_update_run_flag = false

if not ((which cargo) | is-empty) {
    let output_cargo = (cargo install-update -l)
    # 出力を行ごとに分割
    let lines_cargo = $output_cargo | lines # cargo-update の行を解析

    for $line_cargo in $lines_cargo {

        # 優先順位1: cargo-binstall（即座に更新）
        if ($line_cargo | str contains "cargo-binstall") {
            print "Found cargo-binstall in cargo list"
            if ($line_cargo | str contains "Yes") {
                print "Yes update needed for cargo-binstall"
                $cargo_binstall_update_run_flag = true
            }
        } else if (
        # 優先順位2: cargo-update（フラッグ管理、後でbinstall更新）
        $line_cargo | str contains "cargo-update") {
            # 優先順位2: cargo-update（フラッグ管理、後でbinstall更新）
            print "Found cargo-update in cargo list"
            if ($line_cargo | str contains "Yes") {
                print "Yes update needed for cargo-update"
                $cargo_update_app_update_run_flag = true
            }
        } else if (
        # 優先順位3: erg（フラッグ管理、後で特別オプション付きインストール）
        $line_cargo | str contains "erg") {
            # 優先順位3: erg（フラッグ管理、後で特別オプション付きインストール）
            print "Found erg in cargo list"
            if ($line_cargo | str contains "Yes") {
                print "Yes update needed for erg"
                $erg_update_run_flag = true
            }
        } else if (
        # 優先順位4: nu（フラッグ管理、後で特別オプション付きインストール）
        $line_cargo | str contains "nu v") {
            # 優先順位4: nu（フラッグ管理、後で特別オプション付きインストール）
            print "Found nu in cargo list"
            if ($line_cargo | str contains "Yes") {
                print "Yes update needed for nu"
                # nu の更新処理をここに追加する場合は、同様にフラッグを設定するか、直接更新コマンドを実行する
                $nu_update_run_flag = true
            }
            if ($line_cargo | str contains "Yes") {
                print "Yes update needed for nu"
                # nu の更新処理をここに追加する場合は、同様にフラッグを設定するか、直接更新コマンドを実行する
                $nu_update_run_flag = true
            }
        } else if (
        # 優先順位5: 一般的なcargo apps（一括更新フラッグ）
        $line_cargo | str contains "Yes") {
            # 優先順位5: 一般的なcargo apps（一括更新フラッグ）
            $cargo_all_update_run_flag = true
        }
    }

    # 優先順位1: cargo-binstall の更新実行
    if $cargo_binstall_update_run_flag == true {
        print "Updating cargo-binstall"
        cargo binstall --force cargo-binstall
    } else {
        print "No updates available for cargo-binstall"
    }

    # 優先順位2: cargo-update の更新実行
    if $cargo_update_app_update_run_flag == true {
        print "Updating cargo-update"
        cargo binstall --force cargo-update
    } else {
        print "No updates available for cargo-update"
    }

    # 優先順位3: erg の更新実行
    if $erg_update_run_flag == true {
        print "Updating erg"
        cargo install erg --features "japanese full"
    } else {
        print "No updates available for erg"
    }

    # nu の更新実行
    if $nu_update_run_flag == true {
        print "You need is update nu"
        exit
    } else {
        print "No updates available for nu"
    }

    # 優先順位5: 一般的なcargo apps の一括更新
    if $cargo_all_update_run_flag == true {
        print "cargo all apps updating"
        cargo install-update -a
    } else {
        print "No updates available for cargo all apps"
    }
}
