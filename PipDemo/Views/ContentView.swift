//
//  ContentView.swift - created by Gokhan Mutlu on 18.08.2025

import SwiftUI

struct ContentView: View {
    @StateObject var vm = ViewModel()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear {
            vm.onViewAppear()
        }
    }
}

#Preview {
    ContentView()
}
