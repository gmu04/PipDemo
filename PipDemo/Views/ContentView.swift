//
//  ContentView.swift - created by Gokhan Mutlu on 18.08.2025

import SwiftUI

struct ContentView: View {
    @StateObject var vm = ViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                    Text("Hello, world!")
                    
                    
                    Divider()
                        .padding(.bottom, 20)
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
