# ARCHITECTURE

## 依存関係

`Domain` をコアとした、アーキテクチャを作成。

```mermaid
flowchart TB

  subgraph Data
    API
  end

  subgraph Domain
    API --> Service
    Service --> Model
  end

  subgraph Presentation
    Controller --> Service
    View --> Controller
  end

```

## ファイル構成

```tree
lib
├── main.dart
├── app.dart
├── component
│   └── *.dart
├── domain
│   └── *_service.dart
├── gen
│   └── assets.gen.dart
├── model
│   ├── *_error.dart
│   └── *_model.dart
├── provider
│   └── *_provider.dart
├── util
│   └── *.dart
└── view
    └── *.dart
```

### `component`

`view` のための再利用可能な UI 要素を定義する。

### `domain`

`Service` を定義する。
`Data` から取得した情報を抽象化する。

天気データを取得して、アプリの天気モデルにする。

### `gen`

自動生成されたファイル群。

### `model`

`Model` を定義する。
データのシリアライズやデシリアライズを担う。

### `provider`

`view` のためのコントローラーを定義する。

アプリの天気モデルを `view` に渡す。

### `util`

アプリ全体で使用するユーティリティを定義する。

### `view`

アプリの UI やレイアウトを定義する。
