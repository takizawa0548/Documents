# For a Better DFIR Life with Yamato Security OSS Tools

# Windowsイベントログ解析
フォレンジック調査の基本
## 課題
**加工しにくい。**
対象である.evtsはバイナリファイル
→CSV/JSON
**イベントログ専門の知識**
400種類のイベントIDの解析
イベントIDごとにフィールドが異なるため、値の変換をしていく知識が必要
→Sigmaナレッジの活用
**ノイズが多い**
**OS標準機能による解析の限界**

# For a Better DFIR Life
## HAYABUSA
イベントログ解析に特化、Sigmaと連携
.evtxをCSVかJSONに変換してくれる
## Takajo
変換結果のJSONをさらに解析してcsvに出力
コンピューター集計・ユーザー集計・タスクスジュール修正など

## 便利なツール
### Tymeline Explorer
・CSVビューア
。見た目はエクセルライク
・ドラックアンドドロップで簡単にグループんぐ
### jq
・JSONテキストの解析、抽出、変換するためのCLIツール
### Velocirapter
・EDRライクなツール？

## リポジトリ(ツール)
https://github.com/Yamato-Security

## より高度な解析
解析結果をLLMに連携し分析する。
**PandasAI**
データ分析ライブラリ、LLMを活用している

# GitHubCopilotを利用した開発手法？
・関数やシーケンスレベルに落とし込むとCopilotで実装できる？
・他言語パターンの変換
・リファクタや単体テスト
