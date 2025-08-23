//
//  ViewModel + ext.swift - created by Gokhan Mutlu on 23.08.2025

import SwiftUI
import AVKit

//handling PiP delegate methods
extension ViewModel: AVPictureInPictureControllerDelegate{
    func pictureInPictureControllerWillStartPictureInPicture(_ pictureInPictureController: AVPictureInPictureController) {
        print("\(#function)")
    }
    func pictureInPictureControllerDidStartPictureInPicture(_ pictureInPictureController: AVPictureInPictureController) {
        print("\(#function)")
    }
    func pictureInPictureControllerWillStopPictureInPicture(_ pictureInPictureController: AVPictureInPictureController) {
        print("\(#function)")
    }
    func pictureInPictureControllerDidStopPictureInPicture(_ pictureInPictureController: AVPictureInPictureController) {
        print("\(#function)")
    }
}
