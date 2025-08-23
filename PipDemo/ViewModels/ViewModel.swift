//
//  ViewModel.swift - created by Gokhan Mutlu on 19.08.2025

import Foundation
import Combine
import AVFoundation
import AVKit

final class ViewModel: NSObject, ObservableObject{

    @Published var canStartPiP = false
    
    private(set) var player:AVPlayer!
    fileprivate var pipController: AVPictureInPictureController?
    fileprivate var pipPossibleObservation: NSKeyValueObservation?
    private(set) var loremIpsum:String = ""

    private var publisher:NotificationCenter.Publisher = NotificationCenter.default
        .publisher(for:AVPlayerItem.didPlayToEndTimeNotification)
    private var cancellables = Set<AnyCancellable>()
    
    override init(){
        super.init()
        setLoremIpsum()
        createPlayer()
        configureBindings()
    }
    
    func onViewAppear(){
        configureAudioSession()
        play(seekTo: .zero)
    }
    
    private func configureBindings(){
        publisher.sink { [weak self] notification in
            guard let self = self else{ return }
            print("Video starts again")
            self.play(seekTo:.zero)
        }
        .store(in: &cancellables)
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
    
    func startOrStopPiP(){
        guard let pipController = pipController else{ return }
        if pipController.isPictureInPictureActive {
            pipController.stopPictureInPicture()
        }else{
            pipController.startPictureInPicture()
        }
    }
    
    func configurePictureInPicture(_ playerLayer: AVPlayerLayer){
        // Check if PiP is supported
        guard AVPictureInPictureController.isPictureInPictureSupported() else {
            print("Picture-in-Picture is not supported on this device")
            self.canStartPiP = false
            return
        }
        
        print("Picture-in-Picture is supported.")

        pipController = AVPictureInPictureController(playerLayer: playerLayer)
        pipController?.delegate = self
        canStartPiP = pipController?.isPictureInPicturePossible ?? false
        print("pipController.isPictureInPicturePossible: \(canStartPiP)")
        
        self.pipPossibleObservation = pipController?.observe(\AVPictureInPictureController.isPictureInPicturePossible,
        options: [.initial, .new]) { [weak self] _, change in
            // Update the PiP button's enabled state.
            let isItPossible = change.newValue ?? false
            self?.canStartPiP = isItPossible
            print("canStartPiP: \(isItPossible)")
        }
    }
}


extension ViewModel: AVPictureInPictureControllerDelegate{
        
    
}
