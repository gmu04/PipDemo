//
//  HeaderView.swift - created by Gokhan Mutlu on 19.08.2025

import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack {
            Image(systemName: "video")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Picture in Picture (PiP)")
        }
    }
}

#Preview {
    HeaderView()
}
