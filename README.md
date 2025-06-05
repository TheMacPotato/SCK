# ScienceCustomKeyboard リポジトリ

このリポジトリは、iOS 向けの **カスタムキーボード拡張** と、その導入手順を示す **ホストアプリ** の 2 つのモジュールで構成されています。Xcode プロジェクトは `ScienceCustomKeyboard.xcodeproj` に含まれています。

- `SCK/` — キーボード拡張のソースコード
- `ScienceCustomKeyboard/` — ホストアプリのソースコード

以下ではディレクトリ構成や主要なファイル、各コンポーネントの使い方を説明します。

## ディレクトリ構成

```
SCK/
├── Controller/
│   └── KeyboardViewController.swift
├── Extension/
│   └── View+BackgroundColor.swift
├── Model/
│   ├── KeyboardMode.swift
│   ├── ShiftState.swift
│   └── KeyboardDisplayManager.swift
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
│       └── KeyboardView.swift
```

```
ScienceCustomKeyboard/
├── ContentView.swift
├── VideoPlayerView.swift
├── ScienceCustomKeyboardApp.swift
└── HowTo.mp4
```

## 主要コンポーネント

### KeyboardViewController.swift
キーボード拡張のエントリポイントです。`UIInputViewController` を継承し、SwiftUI で実装された `KeyboardView` を `UIHostingController` 経由で組み込みます。入力や削除、カーソル移動などの処理はクロージャとして `KeyboardView` に渡します。

```swift
class KeyboardViewController: UIInputViewController {
    override func viewDidLoad() {
        setup()
    }

    private func setup() {
        let nextKeyboardAction = #selector(self.handleInputModeList(from:with:))
        let keyboardView = KeyboardView(
            needsInputModeSwitchKey: needsInputModeSwitchKey,
            nextKeyboardAction: nextKeyboardAction,
            inputTextAction: { [weak self] text in
                self?.textDocumentProxy.insertText(text)
            },
            deleteTextAction: { [weak self] in
                guard let self, self.textDocumentProxy.hasText else { return }
                self.textDocumentProxy.deleteBackward()
            },
            moveRightAction: { [weak self] in
                guard let self = self else { return }
                if let after = self.textDocumentProxy.documentContextAfterInput {
                    if after.isEmpty {
                        self.textDocumentProxy.adjustTextPosition(byCharacterOffset: 1)
                    } else {
                        let offset = after.prefix(1).utf16.count
                        self.textDocumentProxy.adjustTextPosition(byCharacterOffset: offset)
                    }
                } else {
                    self.textDocumentProxy.adjustTextPosition(byCharacterOffset: 1)
                }
            },
            moveLeftAction: { [weak self] in
                guard let self = self else { return }
                if let before = self.textDocumentProxy.documentContextBeforeInput {
                    let offset = before.prefix(1).utf16.count * -1
                    self.textDocumentProxy.adjustTextPosition(byCharacterOffset: offset)
                } else {
                    self.textDocumentProxy.adjustTextPosition(byCharacterOffset: -1)
                }
            }
        )

        let hostingController = UIHostingController(rootView: keyboardView.BackgroundColor(.clear))
        addChild(hostingController)
        view.addSubview(hostingController.view)
        hostingController.didMove(toParent: self)

        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hostingController.view.leftAnchor.constraint(equalTo: view.leftAnchor),
            hostingController.view.topAnchor.constraint(equalTo: view.topAnchor),
            hostingController.view.rightAnchor.constraint(equalTo: view.rightAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
```

### KeyboardView.swift
複数のキーボードモードを切り替え、各モードごとに専門のサブビューを表示します。ツールバーではモード切替やカーソル移動、改行などの操作を行います。

モードは `KeyboardMode` 列挙型で管理されます。

```swift
enum KeyboardMode: Int {
    case `default` = 0      // 通常モード
    case subscriptMode = 1  // 下付き文字
    case superscript = 2    // 上付き文字
    case greek = 3          // ギリシャ文字
    case math = 4           // 数学記号
}
```

### ShiftState
`ShiftKeyButton` と各キーボードビューで共有する、大文字/小文字の状態を管理するクラスです。`ObservableObject` として宣言され、`@Published var state` が変わるとビューも更新されます。

```swift
final class ShiftState: ObservableObject {
    enum State { case off, on }
    @Published var state: State = .off
    func toggle() { state = (state == .off ? .on : .off) }
}
```

### View コンポーネント
- `NumRow` — 1〜0 の数字キーを横並びに表示します。
- `OperatorRow` — 演算子キーと括弧キー、スラッシュキーをまとめた行を構築します。
- `KeyRow` — 任意の文字キーを 1 行に並べます。
- `ShiftKeyButton` — Shift キー（大文字/小文字切替）。タップで `ShiftState.toggle()` を呼びます。
- `DeleteButton` — 1 文字削除するボタン。`deleteAction` クロージャで動作を指定します。
- `NextKeyboardButton` — 次のキーボードへ切り替えるためのボタン。iOS の仕様上 `UIButton` を重ねています。

### MathKeyboardView など各キーボードビュー
`DefaultKeyboardView`・`SubscriptKeyboardView`・`SuperscriptKeyboardView`・`GreekKeyboardView`・`MathKeyboardView` では、共通の `KeyRow`・`OperatorRow` コンポーネントを組み合わせて、それぞれの文字セットを提供します。親ビューから渡された `keyAction` などのクロージャにより、入力処理をカスタマイズできます。

### ホストアプリ (`ScienceCustomKeyboard`)
アプリを起動すると `ContentView` が表示され、キーボード拡張の有効化手順を動画 (`HowTo.mp4`) とともに案内します。`VideoPlayerView` は `AVPlayerLooper` を用いて動画をループ再生します。

## ビルド方法
1. 本リポジトリをクローンし、`ScienceCustomKeyboard.xcodeproj` を Xcode で開きます。
2. アプリとキーボード拡張の両方がターゲットに含まれています。ビルドしてシミュレータまたは実機で起動します。
3. アプリ内の手順に従ってキーボード拡張を追加すると、科学記号入力用のキーボードが使用できるようになります。

## ライセンス
本リポジトリのコードは MIT ライセンスのもとで公開されています。

