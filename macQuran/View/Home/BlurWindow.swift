//
//  BlurWindow.swift
//  macQuran
//
//  Created by mBilG on 01/07/2021.
//

import SwiftUI

struct BlurWindow: NSViewRepresentable {
    
    func makeNSView(context: Context) -> NSVisualEffectView {
        let view = NSVisualEffectView()
        return view
    }
    
    func updateNSView(_ nsView: NSVisualEffectView, context: Context) { 
    }
}

struct BlurWindow_Previews: PreviewProvider {
    static var previews: some View {
        BlurWindow()
    }
}
