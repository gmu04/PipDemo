//
//  ViewModel.swift - created by Gokhan Mutlu on 19.08.2025

import Foundation
import Combine
import AVFoundation

class ViewModel: ObservableObject{
 
    init(){
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
    
}
