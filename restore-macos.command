#!/usr/bin/env bash
# ========================================================
# Antigravity 2.0 日本語化パッケージ - macOS 復元ツール
# ========================================================

# 切換到腳本所在目錄
cd "$(dirname "$0")" || exit 1

echo ""
echo "========================================================"
echo "  Antigravity 2.0 日本語化パッケージ - 復元"
echo "========================================================"
echo ""

# 前置チェック：Node.js
echo "[前置チェック] Node.js 環境を確認中..."
if ! command -v node &> /dev/null; then
    echo ""
    echo "[エラー] Node.js が見つかりません。"
    echo "  https://nodejs.org/ から LTS 版をインストールし、"
    echo "  node がシステム PATH に追加されていることを確認してください。"
    echo ""
    read -r -p "Enter キーを押して終了..."
    exit 1
fi

echo "[前置チェック] Node.js は準備完了です。"
echo ""

echo "[1/3] Antigravity プロセスを検出して終了中..."
pkill -f Antigravity > /dev/null 2>&1
sleep 2

echo ""
echo "[2/3] 公式版ファイルを復元中..."
node localization_engine.js --restore "$@"

echo ""
echo "[3/3] 復元完了！"
echo ""
echo "[注意] Antigravity は公式英語版の状態に復元されました。"
echo ""
read -r -p "Enter キーを押して終了..."
