@echo off
:: ========================================================
:: Antigravity 2.0 日本語化パッケージ - 復元ツール
:: ========================================================
chcp 65001 >nul
title Antigravity 日本語化パッケージ - 公式版に復元

echo.
echo ========================================================
echo   Antigravity 2.0 日本語化パッケージ - 復元
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

echo [前置チェック] Node.js は準備完了です。
echo.

echo [1/3] Antigravity プロセスを検出して終了中...
taskkill /f /im Antigravity.exe /t >nul 2>nul
timeout /t 2 /nobreak >nul

echo.
echo [2/3] 公式版ファイルを復元中...
node "%~dp0localization_engine.js" --restore %*

echo.
echo [3/3] 復元完了！
echo.
echo [注意] Antigravity は公式英語版の状態に復元されました。
echo.
pause
