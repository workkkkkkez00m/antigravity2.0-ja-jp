@echo off
:: ========================================================
:: Antigravity 2.0 日本語化パッケージ - インストールツール
:: ========================================================
chcp 65001 >nul
title Antigravity 日本語化パッケージ - インストール

echo.
echo ========================================================
echo   Antigravity 2.0 日本語化パッケージ
echo ========================================================
echo.

:: 檢查 Node.js 是否可用
echo [前置チェック] Node.js 環境を確認中...
node -v >nul 2>nul
if errorlevel 1 (
    echo.
    echo [エラー] Node.js が見つかりません。
    echo   https://nodejs.org/ から LTS 版をインストールし、
    echo   node がシステム PATH に追加されていることを確認してください。
    echo   「アクセスが拒否されました」と表示される場合は、
    echo   Node.js を再インストールして PATH 設定を確認してください。
    echo.
    pause
    exit /b 1
)

:: 檢查本地 @electron/asar 是否已安裝
if not exist "%~dp0node_modules\@electron\asar\bin\asar.js" (
    echo.
    echo [エラー] ローカル @electron/asar CLI が見つかりません。
    echo   プロジェクトルートで以下を実行してください：
    echo     npm install
    echo   完了後、再度インストールスクリプトを実行してください。
    echo.
    pause
    exit /b 1
)

echo [前置チェック] Node.js と asar CLI は準備完了です。
echo.

echo [1/3] Antigravity プロセスを検出して終了中...
taskkill /f /im Antigravity.exe /t >nul 2>nul
timeout /t 2 /nobreak >nul

echo.
echo [2/3] 日本語ローカライズを適用中...
node "%~dp0localization_engine.js" %*

echo.
echo [3/3] 適用完了！
echo.
echo [注意] Antigravity を手動で再起動してください。
echo.
pause
