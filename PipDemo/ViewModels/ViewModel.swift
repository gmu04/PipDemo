//
//  ViewModel.swift - created by Gokhan Mutlu on 19.08.2025

import Foundation
import Combine
import AVFoundation
import AVKit

class ViewModel: ObservableObject{
 
    private(set) var player:AVPlayer!
    private(set) var pipController: AVPictureInPictureController?
    private(set) var loremIpsum:String = ""

    init(){
        setLoremIpsum()
        createPlayer()
    }
    
    func onViewAppear(){
        configureAudioSession()
        play(seekTo: .zero)
    }
    
    private func setLoremIpsum(){
        guard let pathLoremIpsum = Bundle.main.path(forResource: "LoremIpsum", ofType: "txt") else {
            fatalError("Lorem Ipsum file not found")
        }
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: pathLoremIpsum))
            if let string = String(data: data, encoding: .utf8) {
                self.loremIpsum = string
            }
        } catch {
            print("Error reading file: \(error)")
        }
    }

}

extension ViewModel{
    fileprivate func play(seekTo time:CMTime? = nil){
        if let time = time{
            player.seek(to: time)
        }
        player.play()
    }
    
    fileprivate func createPlayer(){
        guard let path = Bundle.main.path(forResource: "pexels-waves", ofType: "mp4") else {
            fatalError("Video not found")
        }
        let asset = AVURLAsset(url: URL(filePath: path))
        let playerItem = AVPlayerItem(asset: asset)
        self.player = AVPlayer(playerItem: playerItem)
    }
    
    fileprivate func configureAudioSession() {
        do {
            let audioSession = AVAudioSession.sharedInstance()
            // Configure the app for playback of long-form movies.
            try audioSession.setCategory(.playback, mode: .moviePlayback)
            try audioSession.setActive(true)
        } catch {
            print("Failed to setup audio session: \(error)")
        }
    }
}
