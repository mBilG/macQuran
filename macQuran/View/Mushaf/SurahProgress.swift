//
//  SurahProgress.swift
//  macQuran
//
//  Created by mBilG on 02/07/2021.
//

import SwiftUI

struct SurahProgress: View {
    
    public var page: String

    var body: some View {
        ProgressView(value: Double(page), total: 604)
            .rotationEffect(.degrees(180))
            .padding(.horizontal)
            .opacity(0.5)
    }
}

struct SurahProgress_Previews: PreviewProvider {
    static var previews: some View {
        SurahProgress(page: "100")
    }
}
