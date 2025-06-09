# ScienceCustomKeyboard リポジトリ

このリポジトリは、iOS 向けの **カスタムキーボード拡張**「SCK」と、その導入手順を案内する **ホストアプリ** から構成されています。プロジェクト全体は `ScienceCustomKeyboard.xcodeproj` で管理されています。

- `SCK/` — キーボード拡張のソースコード
- `ScienceCustomKeyboard/` — ホストアプリのソースコード

以下ではディレクトリ構成と主要ファイルの役割、ビルド方法などをまとめます。

## ディレクトリ構成
```text
SCK/
├── Controller/
│   └── KeyboardViewController.swift
├── Extension/
│   └── View+BackgroundColor.swift
├── Model/
│   ├── KeyboardMode.swift
│   ├── ShiftState.swift
│   └── KeyboardDisplayManager.swift  # 予備ファイル（現状は未使用）
├── View/
│   ├── Component/
│   │   ├── DeleteButton.swift
│   │   ├── KeyboardComponents.swift
│   │   ├── NextKeyboardButton.swift
│   │   ├── NumRow.swift
│   │   └── ShiftKeyButton.swift
│   ├── Keyboard/
│   │   ├── DefaultKeyboardView.swift
│   │   ├── GreekKeyboardView.swift
│   │   ├── MathKeyboardView.swift
│   │   ├── SubscriptKeyboardView.swift
│   │   └── SuperscriptKeyboardView.swift
│   └── Root/
│       ├── KeyboardView.swift
│       └── KeyboardView_old.swift  # 旧バージョンの参考実装
ScienceCustomKeyboard/
├── ContentView.swift
├── VideoPlayerView.swift
├── ScienceCustomKeyboardApp.swift
└── HowTo.mp4
```

## 主なコンポーネント
### KeyboardViewController.swift
`UIInputViewController` を継承したキーボード拡張のエントリポイントです。SwiftUI の `KeyboardView` を `UIHostingController` でラップして組み込み、入力・削除・カーソル移動といった処理をクロージャで渡します。

### KeyboardView.swift
複数のキーボードモードを切り替えて表示するメインビューです。`KeyboardMode` に応じて `DefaultKeyboardView` などの各サブビューを表示し、ツールバーでモード変更やカーソル移動、改行などを行います。

### 各キーボードビュー
`View/Keyboard` 以下に配置されている5種類のビューで、通常文字・上付き・下付き・ギリシャ文字・数学記号をそれぞれレイアウトします。共通の `KeyRow` や `OperatorRow` コンポーネントを用いて構築され、入力処理は親ビューから受け取ります。

### 共通コンポーネント
`View/Component` には以下のような再利用可能な部品が含まれます。
- `ShiftKeyButton` — 大文字/小文字を切り替えるボタン。`ShiftState` を環境オブジェクトとして利用します。
- `DeleteButton` — 1 文字削除するボタン。クロージャで動作を渡します。
- `NextKeyboardButton` — 次のキーボードへ切り替えるボタン。iOS の仕様上 `UIButton` をオーバーレイしています。
- `NumRow` — 数字キーを横並びに表示。
- `KeyboardComponents.swift` — 汎用的なキー配置を定義するビュー群（`KeyRow`、`OperatorRow` など）。

### モデル
- `KeyboardMode` — キーボードの表示モードを表す列挙型。
- `ShiftState` — Shift キーの状態を管理する `ObservableObject`。
- `KeyboardDisplayManager` — 将来の表示制御のために用意されたプレースホルダです。

### ホストアプリ
`ScienceCustomKeyboard` フォルダには、キーボード拡張の導入手順を示すシンプルなアプリが含まれます。`ContentView` で説明用の動画 (`HowTo.mp4`) を再生し、ユーザーに設定方法を案内します。

## ビルド方法
1. リポジトリをクローンし、`ScienceCustomKeyboard.xcodeproj` を Xcode で開きます。
2. ターゲットにはアプリ本体とキーボード拡張が含まれているので、そのままビルドしてシミュレーターまたは実機で起動します。
3. アプリ起動後、画面の手順に従ってキーボード拡張を追加すると、科学記号入力用のキーボードが使用可能になります。

## コードを学ぶ際のポイント
1. **SwiftUI と UIKit の連携** — `KeyboardViewController` が `UIHostingController` を使って SwiftUI のビューを統合しています。
2. **モード切り替えの仕組み** — `KeyboardMode` と `KeyboardView` の実装を読むと、どのようにサブビューを入れ替えているかがわかります。
3. **状態管理** — `ShiftState` を `@EnvironmentObject` として各ビューに共有し、大文字/小文字の切り替えを実現します。
4. **ホストアプリの役割** — 設定手順や動画再生の実装を通じて、キーボード拡張の有効化方法を学べます。

## ライセンス
本リポジトリのコードは MIT ライセンスのもとで公開されています。
