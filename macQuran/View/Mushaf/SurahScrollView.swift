//
//  SurahScrollView.swift
//  macQuran
//
//  Created by mBilG on 02/07/2021.
//

import SwiftUI

struct SurahScrollView: View {
    
    @StateObject var homeData : HomeViewModel
    
    var body: some View {
        
        let columns = Array(repeating: GridItem(.flexible(), spacing: 0), count: 1)

        ScrollView(showsIndicators: false){
            LazyVGrid(columns: columns, content: {
                ForEach(surahs){surah in
                    SurahButton(surah: surah, selectedPage: $homeData.selectedPage, arabicFont:homeData.arabicFont)
                }
            })
        }
    }
}
