# For a Better DFIR Life with Yamato Security OSS Tools

# Windows イベントログ解析

フォレンジック調査の基本

## 課題

**加工しにくい。**
対象である.evts はバイナリファイル
→CSV/JSON
**イベントログ専門の知識**
400 種類のイベント ID の解析
イベント ID ごとにフィールドが異なるため、値の変換をしていく知識が必要
→Sigma ナレッジの活用
**ノイズが多い**
**OS 標準機能による解析の限界**

# For a Better DFIR Life

## HAYABUSA

イベントログ解析に特化、Sigma と連携
.evtx を CSV か JSON に変換してくれる

## Takajo

変換結果の JSON をさらに解析して csv に出力
コンピューター集計・ユーザー集計・タスクスジュール修正など

## 便利なツール

### Tymeline Explorer

・CSV ビューア
。見た目はエクセルライク
・ドラックアンドドロップで簡単にグループんぐ

### jq

・JSON テキストの解析、抽出、変換するための CLI ツール

### Velocirapter

・EDR ライクなツール？

## リポジトリ(ツール)

https://github.com/Yamato-Security

## より高度な解析

解析結果を LLM に連携し分析する。
**PandasAI**
データ分析ライブラリ、LLM を活用している

# GitHubCopilot を利用した開発手法？

・関数やシーケンスレベルに落とし込むと Copilot で実装できる？
・他言語パターンの変換
・リファクタや単体テスト
