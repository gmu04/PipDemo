//
//  GmuVideoPlayer.swift - created by Gokhan Mutlu on 22.08.2025

import SwiftUI
import AVFoundation

struct GmuVideoPlayer: UIViewRepresentable {
    typealias UIViewType = GmuVideoPlayerView
    let player: AVPlayer
    let onLayerReady: (AVPlayerLayer) -> Void
    
    func makeUIView(context: Context) -> GmuVideoPlayerView {
        let view = GmuVideoPlayerView()
        view.player = player
        
        DispatchQueue.main.async {
            onLayerReady(view.playerLayer)
        }
        return view
    }
    
    func updateUIView(_ uiView: GmuVideoPlayerView, context: Context) {
        if uiView.player !== player{
            uiView.player = player
            onLayerReady(uiView.playerLayer)
        }
    }
    
}


//MARK: -

class GmuVideoPlayerView: UIView{
    var playerLayer:AVPlayerLayer{
        return layer as! AVPlayerLayer
    }
    
    override class var layerClass: AnyClass{
        return AVPlayerLayer.self
    }
    
    var player: AVPlayer?{
        get{ playerLayer.player }
        set{ playerLayer.player = newValue }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        playerLayer.videoGravity = .resizeAspect
        backgroundColor = .black
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
