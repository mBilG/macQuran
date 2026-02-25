//
//  HizbScrollView.swift
//  macQuran
//
//  Created by mBilG on 07/07/2021.
//

import SwiftUI

struct HizbScrollView: View {
    
    @StateObject var homeData : HomeViewModel
    
    var body: some View {

        let columns = Array(repeating: GridItem(.flexible(), spacing: 0), count: 1)
        
        ScrollView(showsIndicators: false){
            LazyVGrid(columns: columns, content: {
                ForEach(hizbs){hizb in
                    
                    HizbButton(hizb: hizb, selectedPage: $homeData.selectedPage, arabicFont: homeData.arabicFont)
                    
                }
            })
        }
    }
}
