import SwiftUI
import AVKit

struct VideoPlayerView: UIViewControllerRepresentable {
    let videoURL: URL

    class Coordinator: NSObject {
        var playerLooper: AVPlayerLooper?
    }

    func makeCoordinator() -> Coordinator {
        Coordinator()
    }

    func makeUIViewController(context: Context) -> AVPlayerViewController {
        do {
            try AVAudioSession.sharedInstance().setCategory(.ambient, options: [.mixWithOthers])
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print("音声セッションの設定に失敗しました: \(error)")
        }
        
        let playerViewController = AVPlayerViewController()
        let player = AVQueuePlayer()
        let playerItem = AVPlayerItem(url: videoURL)
        context.coordinator.playerLooper = AVPlayerLooper(player: player, templateItem: playerItem)

        playerViewController.player = player
        playerViewController.showsPlaybackControls = false
        player.isMuted = true // ミュートにする
        player.play()

        // プレイヤービューのコンテンツモードをアスペクトフィルに設定
        playerViewController.videoGravity = .resizeAspectFill

        return playerViewController
    }

    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
        // 更新時の処理は不要
    }
}
