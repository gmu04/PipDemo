//
//  PipButtonView.swift - created by Gokhan Mutlu on 23.08.2025

import SwiftUI
import AVKit

struct PipButtonView: View {
    @ObservedObject var vm: ViewModel

    @State private var isSelected:Bool = false

    private let startImage = AVPictureInPictureController.pictureInPictureButtonStartImage
    private let stopImage = AVPictureInPictureController.pictureInPictureButtonStopImage
          
    
//    init(_ vm:Binding<ViewModel>){
//        self.vm = vm
//    }
    var body: some View {
        Button {
            
            isSelected.toggle()
            vm.pipController?.startPictureInPicture()
            
        } label: {
            Image(uiImage:(isSelected ? stopImage : startImage)
                .withRenderingMode(.alwaysTemplate))
                .resizable()
                .frame(width: 50, height: 50)
                .foregroundStyle(vm.canStartPiP ? .blue : .gray)
        }
        .disabled(!vm.canStartPiP)

    }
}


#Preview {
    PipButtonView(vm: ViewModel())
}
