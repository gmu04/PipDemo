//
//  ContentView.swift - created by Gokhan Mutlu on 18.08.2025

import SwiftUI

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
