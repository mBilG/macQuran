//
//  LeftSidebar.swift
//  macQuran
//
//  Created by mBilG on 03/07/2021.
//

import SwiftUI

struct LeftSidebar: View {
    @StateObject var homeData : HomeViewModel
    var body: some View {
        
        VStack{
            TabButton(title: "Mushaf", image: "book", selectedTab: $homeData.selectedTab)
            Spacer().frame(height:20)
            TabButton(title: "Recitation", image: "waveform", selectedTab: $homeData.selectedTab)
            Spacer()
            TabButton(title: "Settings", image: "gear", selectedTab: $homeData.selectedTab)
        }
        .padding(.top, 40)
        
    }
}
