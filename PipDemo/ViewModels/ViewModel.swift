//
//  ViewModel.swift - created by Gokhan Mutlu on 19.08.2025

import Foundation
import Combine
import AVFoundation

class ViewModel: ObservableObject{
 
    private(set) var loremIpsum:String = ""

    init(){
        setLoremIpsum()
    }
    
    func onViewAppear(){
        configureAudioSession()
    }
    
    private func configureAudioSession() {
        do {
            let audioSession = AVAudioSession.sharedInstance()
            // Configure the app for playback of long-form movies.
            try audioSession.setCategory(.playback, mode: .moviePlayback)
            try audioSession.setActive(true)
        } catch {
            print("Failed to setup audio session: \(error)")
        }
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
