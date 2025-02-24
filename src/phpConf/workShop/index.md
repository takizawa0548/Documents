# PHP エンジニアのためのアクターモデル完全ガイド

## 概要

### 使用リポジトリ

https://github.com/ytake/phpcon2024-actor-model

## 説明

### 講演者

・竹澤さん（ytake）　  
千株式会社 CTO

### アクターモデル

・PHP だと馴染みがないと思うので今回はハンズオン

### アクターモデルって？

#### Phluxtor

・ytake さんが作ったやつ  
・PHP のランタイム上では実現が難しかった。Node.js も同様。  
・Scalar ,Kotlin ,Java だと割とお馴染み

### 説明

・並行計算の数学的モデルの一種  
・Scala の裏側はこれ  
・銀行の送金系などは海外ではアクターモデル  
・プログラミングの考え方が OOP（関数型）とは違う  
・Call して振る舞いを変えるという仕組みがない。仕事を依頼するのみ？ ・初見の人は
ほとんど理解できないかも

### 哲学

「アクターモデルは全てがアクター」

### 今までと違うもの

今まで ・PHP のプロセスが動いて、処理が動いてプロセスが止まる  
これから  
・State マシン（状態が変わったらイベントを墓する）

### 仕組み

・Actor はメッセージ（FIFO）を Actor に投げて、Mailbox というので受け取る。  
・Actor は位置透過性があり、アドレスがユニーク  
・構成(メールっぽい？)  
address,Header,Message  
・インスタンスは生成されて、要求がないと動かない  
・MailBox から立ち上がり、インスタンスが立ち上がる。  
・Stopping の状態になると止まる

### Hierarchy

・アクターはアクターを生成できる  
・親子関係が形成される  
 ガーディアンシステムアクター>Foo>/Foo/A...  
 構造は木構造というわけではなくシナプス構造であることに注意  
 横の関係ができる  
・電源のスイッチの意識を持つとなんとなくわかるかも  
・子アクターに仕事が依頼できる

### Fault Tolerance

・親アクターが子アクターを監督管理する責務  
・親子関係にないアクターも監視することができる  
・インスタンスを再生成させて再起動させることができる  
・アクターの障害は検知はするが他に伝播しないーまさにネズミ公・・・  
　時間をおいてリトライしてと指示できる

### Supervision

・壊れたらそのままにするとか、時間を延ばしながらリトライするとか、リトライしかし
ないとか・・・

### コードの中身

#### recive

メッセージで受け取った内容で Switch 分岐して処理

### 仕組みの分類(一部？)

#### Remoting

？

#### Cluster

大規模向け

### PHP だけで作ったの？

PHP では難しく、Swall?を使っているとのこと

### Q&A

・便利そうだなぁと思ったんですけど、具体的な使い所  
今までと違う開発体験になるので、やってみないとわからないという感じ

## 今回のハンズオン

そんな難しいコードは書かない。  
fromProducer で actor を起動する。

### Send Message

・メッセージは fire-and-forget  
・send メソッド、双方向は request 系メソッド  
・Tell／Ask は request/Response で実現

### ユースケース

・Actor はイベント駆動

#### 学校のテスト

・教室  
　 Classroom  
・先生が生徒に対して算数のテストを実施  
・生徒は個人で解く  
　 StundentActor ・先生は見守るなど  
　 Teacher ・全て答えたら提出する

##### story

・Classroom が Teacher を産み、授業の開始を伝える  
・Teacher が Student Actor を産む  
・Student が並行計算を始め Teacher に返す  
・Teacher が授業の終了を Classroom に伝える

### あとは実施のみ！
