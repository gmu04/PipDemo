//
//  ContentView.swift - created by Gokhan Mutlu on 18.08.2025

import SwiftUI
import AVKit

struct ContentView: View {
    @StateObject var vm = ViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    HeaderView()
                        .font(.headline)
                        .foregroundStyle(.blue)
                    
                    //player
                    GmuVideoPlayer(player: vm.player) { avPlayerLayer in
                        
                    }
                    .frame(width: .infinity, height: 320, alignment: .center)
                    
                    PipButtonView(vm)
                        
                    
                    Divider()
                    
                    LoremIpsumView(vm.loremIpsum)
                        .font(.system(size: 12))
                }
            }
            .padding()
            .edgesIgnoringSafeArea(.bottom)
        }
        .onAppear {
            vm.onViewAppear()
        }
    }
}

#Preview {
    ContentView()
}

struct PipButtonView: View {
    let vm: ViewModel

    @State private var isSelected:Bool = false

    private let startImage = AVPictureInPictureController.pictureInPictureButtonStartImage
    private let stopImage = AVPictureInPictureController.pictureInPictureButtonStopImage
          
    
    init(_ vm:ViewModel){
        self.vm = vm
    }
    var body: some View {
        Button {
            isSelected.toggle()
        } label: {
            Image(uiImage:(isSelected ? stopImage : startImage)
                .withRenderingMode(.alwaysTemplate))
                .resizable()
                .frame(width: 50, height: 50)
                .foregroundStyle(. blue)
        }

    }
}
