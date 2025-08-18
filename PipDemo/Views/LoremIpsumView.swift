//
//  LoremIpsumView.swift - created by Gokhan Mutlu on 19.08.2025

import SwiftUI

struct LoremIpsumView: View {
    var text:String

    init(_ text:String){
        self.text = text
    }
    
    var body: some View {
        VStack {
            Text("Lorem Ipsum Header")
                .font(.headline)
            Text(text)
        }
    }
}

#Preview {
    LoremIpsumView("Lorem Ipsum Body")
}
