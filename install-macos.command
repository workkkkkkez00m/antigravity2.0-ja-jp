#!/usr/bin/env bash
# ========================================================
# Antigravity 2.0 日本語化パッケージ - macOS インストールツール
# ========================================================

# 切換到腳本所在目錄
cd "$(dirname "$0")" || exit 1

echo ""
echo "========================================================"
echo "  Antigravity 2.0 日本語化パッケージ"
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

# 前置チェック：ローカル @electron/asar CLI
if [ ! -f "./node_modules/@electron/asar/bin/asar.js" ]; then
    echo ""
    echo "[エラー] ローカル @electron/asar CLI が見つかりません。"
    echo "  プロジェクトルートで以下を実行してください："
    echo "    npm install"
    echo "  完了後、再度インストールスクリプトを実行してください。"
    echo ""
    read -r -p "Enter キーを押して終了..."
    exit 1
fi

echo "[前置チェック] Node.js と asar CLI は準備完了です。"
echo ""

echo "[1/3] Antigravity プロセスを検出して終了中..."
pkill -f Antigravity > /dev/null 2>&1
sleep 2

echo ""
echo "[2/3] 日本語ローカライズを適用中..."
node localization_engine.js "$@"

echo ""
echo "[3/3] 適用完了！"
echo ""
echo "[注意] Antigravity を手動で再起動してください。"
echo ""
read -r -p "Enter キーを押して終了..."
