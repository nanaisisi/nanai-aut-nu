#originally created by: scoop project
#get.scoop.sh
#https://github.com/ScoopInstaller/Install/blob/master/install.ps1

#Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
# Invoke-RestMethod -Uri https://github.com/nanaisisi/nanai-aut-nu/tree/main/windows_env.ps1 | Invoke-Expression

# Issue Tracker: https://github.com/nanaisisi/nanai-aut-nu/issues

# Prepare variables
$IS_EXECUTED_FROM_IEX = ($null -eq $MyInvocation.MyCommand.Path)

# Abort when the language mode is restricted
Test-LanguageMode

# nanai-aut-nu root directory
$nanai_aut_nu_DIR = $nanai_aut_nuDir, $env:nanai_aut_nu, "$env:USERPROFILE\nanai-aut-nu" | Where-Object { -not [String]::IsNullOrEmpty($_) } | Select-Object -First 1
## nanai-aut-nu cache directory
$nanai_aut_nu_CACHE_DIR = $nanai_aut_nuCacheDir, $env:nanai_aut_nu_CACHE, "$nanai-aut-nu_DIR\cache" | Where-Object { -not [String]::IsNullOrEmpty($_) } | Select-Object -First 1
# nanai-aut-nu config file location
$nanai_aut_nu_CONFIG_HOME = $env:XDG_CONFIG_HOME, "$env:USERPROFILE\.config" | Select-Object -First 1
$nanai_aut_nu_CONFIG_FILE = "$nanai-aut-nu_CONFIG_HOME\nanai-aut-nu\config.json"


$nanai_aut_nu_PACKAGE_GIT_REPO = 'https://github.com/nanaisisi/nanai-aut-nu.git'


function Install-nanai_aut-nu {
    Write-InstallInfo 'Initializing...'
    # Validate install parameters
    Test-ValidateParameter
    # Check prerequisites
    Test-Prerequisite
    # Enable TLS 1.2
    Optimize-SecurityProtocol

    # Download nanai_aut-nu from GitHub
    Write-InstallInfo 'Downloading...'
    $downloader = Get-Downloader

    if (Test-CommandAvailable('git')) {
        $old_https = $env:HTTPS_PROXY
        $old_http = $env:HTTP_PROXY
        try {
            if ($downloader.Proxy) {
                #define env vars for git when behind a proxy
                $Env:HTTP_PROXY = $downloader.Proxy.Address
                $Env:HTTPS_PROXY = $downloader.Proxy.Address
            }
            Write-Verbose "Cloning $nanai_aut_nu_PACKAGE_GIT_REPO to $nanai_aut_nu_APP_DIR"
            git clone -q $nanai_aut_nu_PACKAGE_GIT_REPO $nanai_aut_nu_APP_DIR
            if (-Not $?) {
                throw 'Cloning failed. Falling back to downloading files.'
            }
        } catch {
            Write-Warning "$($_.Exception.Message)"
        } finally {
            $env:HTTPS_PROXY = $old_https
            $env:HTTP_PROXY = $old_http
        }
    }


    # Setup initial configuration of nanai_aut-nu
    Add-DefaultConfig

    Write-InstallInfo 'nanai_aut-nu was installed successfully!' -ForegroundColor DarkGreen
    Write-InstallInfo "Type 'nanai_aut-nu help' for instructions."
}

# Quit if anything goes wrong
$oldErrorActionPreference = $ErrorActionPreference
$ErrorActionPreference = 'Stop'

# Logging debug info
Write-DebugInfo $PSBoundParameters

# Nushellの自動インストール（cargo経由）
function Install-Nushell {
    if (!(Get-Command 'nu' -ErrorAction SilentlyContinue)) {
        Write-Output 'Nushellが見つかりません。自動インストールを開始します。'
        # scoopがなければインストール
        if (!(Get-Command 'scoop' -ErrorAction SilentlyContinue)) {
            Write-Output 'scoopが見つかりません。scoopをインストールします。'
            Set-ExecutionPolicy RemoteSigned -Scope CurrentUser -Force
            Invoke-Expression (Invoke-RestMethod 'https://get.scoop.sh')
        }
        # scoopでnushellをインストール
        scoop install nu
        Write-Output 'Nushellのインストールが完了しました。'
    } else {
        Write-Output 'Nushellは既にインストールされています。'
    }
}

# Nushellインストールを最初に実行
Install-Nushell

# Reset $ErrorActionPreference to original value
$ErrorActionPreference = $oldErrorActionPreference

scoop install aria2
scoop install git
scoop install gh
